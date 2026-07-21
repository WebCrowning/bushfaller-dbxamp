import { NextResponse } from "next/server";
import { env, getRequiredEnv } from "@/lib/env";
import { query } from "@/lib/db";
import { paypalCreateOrderSchema } from "@/lib/validation";
import { checkRateLimit } from "@/lib/rate-limit";
import { getClientIp, validateJsonRequest, validateSameOrigin } from "@/lib/request-security";
import { auth } from "@/auth";
import { ZodError } from "zod";

type ProductPriceRow = {
  id: number;
  name: string;
  price: number;
  transport_fee: number;
  stock_packages: number;
  package_name: "pack" | "bag" | "bundle" | "carton";
  unit_type: "pcs" | "kg";
  unit_value: number;
};

type PayPalCreateOrderResponse = {
  id: string;
  status: string;
  links?: Array<{ rel: string; href: string }>;
};

type PayPalApiErrorResponse = {
  name?: string;
  message?: string;
  details?: Array<{ issue?: string; description?: string }>;
};

type CheckoutSnapshotItem = {
  productId: number;
  quantityPackages: number;
  unitPrice: number;
  unitTransportFee: number;
  packageName: "pack" | "bag" | "bundle" | "carton";
  unitType: "pcs" | "kg";
  unitValue: number;
};

function normalizePackageQty(value: number) {
  return Math.max(1, Math.round(Number(value)));
}

function formatZodError(error: ZodError) {
  const flat = error.flatten();
  const fieldMessages = Object.values(flat.fieldErrors)
    .flat()
    .filter((msg): msg is string => Boolean(msg));
  const messages = [...flat.formErrors, ...fieldMessages];
  return messages[0] ?? "Invalid request payload";
}

function assertPaypalEnvironmentConsistency() {
  const baseUrl = env.paypalBaseUrl.toLowerCase();
  const isSandboxBase = baseUrl.includes("sandbox");
  const expectedEnv = (process.env.PAYPAL_ENV ?? process.env.NEXT_PUBLIC_PAYPAL_ENV ?? "")
    .trim()
    .toLowerCase();
  const publicClientId = (process.env.NEXT_PUBLIC_PAYPAL_CLIENT_ID ?? "").trim();
  const serverClientId = (process.env.PAYPAL_CLIENT_ID ?? "").trim();

  if (publicClientId && serverClientId && publicClientId !== serverClientId) {
    throw new Error("Mismatch: NEXT_PUBLIC_PAYPAL_CLIENT_ID and PAYPAL_CLIENT_ID must be from the same PayPal app");
  }

  if (!expectedEnv) {
    return;
  }

  if (expectedEnv === "sandbox" && !isSandboxBase) {
    throw new Error("Mismatch: PAYPAL_ENV is sandbox but PAYPAL_BASE_URL is live");
  }

  if ((expectedEnv === "live" || expectedEnv === "production") && isSandboxBase) {
    throw new Error("Mismatch: PAYPAL_ENV is live but PAYPAL_BASE_URL is sandbox");
  }
}

async function getPaypalToken() {
  const clientId = getRequiredEnv("PAYPAL_CLIENT_ID", env.paypalClientId);
  const clientSecret = getRequiredEnv("PAYPAL_CLIENT_SECRET", env.paypalClientSecret);

  const basicToken = Buffer.from(`${clientId}:${clientSecret}`).toString("base64");

  const response = await fetch(`${env.paypalBaseUrl}/v1/oauth2/token`, {
    method: "POST",
    headers: {
      Authorization: `Basic ${basicToken}`,
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: "grant_type=client_credentials",
  });

  if (!response.ok) {
    const errorText = await response.text();
    console.error("PayPal token error:", errorText);
    throw new Error("Failed to get PayPal token");
  }

  const payload = (await response.json()) as { access_token: string };
  return payload.access_token;
}

export async function POST(request: Request) {
  try {
    const invalidOriginResponse = validateSameOrigin(request);
    if (invalidOriginResponse) {
      return invalidOriginResponse;
    }

    const invalidContentTypeResponse = validateJsonRequest(request);
    if (invalidContentTypeResponse) {
      return invalidContentTypeResponse;
    }

    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const clientIp = getClientIp(request);

    const rateLimit = checkRateLimit({
      key: `paypal-create:${session.user.id}:${clientIp}`,
      windowMs: 60_000,
      maxRequests: 12,
    });

    if (!rateLimit.allowed) {
      return NextResponse.json(
        { error: "Too many checkout attempts. Please try again shortly." },
        {
          status: 429,
          headers: {
            "Retry-After": String(rateLimit.retryAfterSeconds),
          },
        },
      );
    }

    const payload = await request.json().catch(() => null);
    const parsed = paypalCreateOrderSchema.safeParse(payload);

    if (!parsed.success) {
      return NextResponse.json(
        { error: formatZodError(parsed.error) },
        { status: 400 },
      );
    }

    const { items, total } = parsed.data;
    assertPaypalEnvironmentConsistency();

    // SECURITY: Verify product prices from database (source of truth)
    // Frontend prices are for UX only; backend must validate
    const quantityByProduct = new Map<number, number>();
    for (const item of items) {
      const normalizedQty = normalizePackageQty(Number(item.quantityPackages));
      quantityByProduct.set(
        item.productId,
        (quantityByProduct.get(item.productId) ?? 0) + normalizedQty,
      );
    }

    const productIds = Array.from(quantityByProduct.keys());

    if (productIds.length === 0) {
      return NextResponse.json(
        { error: "No valid products in order" },
        { status: 400 },
      );
    }

    // Fetch actual product prices from database
    const placeholders = productIds.map(() => "?").join(",");
    const productRows = await query<ProductPriceRow[]>(
      `SELECT id, name, price, transport_fee, stock_packages, package_name, unit_type, unit_value FROM products WHERE id IN (${placeholders})`,
      productIds,
    );

    if (productRows.length !== productIds.length) {
      return NextResponse.json(
        { error: "One or more products not found" },
        { status: 404 },
      );
    }

    // Build verified price map from database
    const priceMap = new Map<number, ProductPriceRow>();
    productRows.forEach((row) => {
      priceMap.set(row.id, row);
    });

    // SECURITY: Calculate totals from database prices only (source of truth)
    // Do not hard-fail on frontend price fields because cart data can be stale.
    let verifiedTotal = 0;

    // Check stock and calculate total against aggregated quantities
    for (const [productId, quantity] of quantityByProduct.entries()) {
      const dbProduct = priceMap.get(productId);
      if (!dbProduct) {
        return NextResponse.json(
          { error: `Product ${productId} not found in database` },
          { status: 404 },
        );
      }

      if (quantity > Number(dbProduct.stock_packages)) {
        return NextResponse.json(
          {
            error: `Insufficient package stock for ${dbProduct.name}. Requested ${quantity} package(s), available ${Number(dbProduct.stock_packages)} package(s).`,
            productId,
            productName: dbProduct.name,
            requestedPackages: quantity,
            availablePackages: Number(dbProduct.stock_packages),
          },
          { status: 409 },
        );
      }

      verifiedTotal +=
        (Number(dbProduct.price) + Number(dbProduct.transport_fee)) * quantity;
    }

    // Round to 2 decimal places
    verifiedTotal = Math.round(verifiedTotal * 100) / 100;

    if (!Number.isFinite(verifiedTotal) || verifiedTotal <= 0) {
      return NextResponse.json(
        { error: "Amount must be greater than 0" },
        { status: 400 },
      );
    }

    console.info(
      `PAYPAL TOTAL: client=${Number(total).toFixed(2)}, verified=${verifiedTotal.toFixed(2)}`,
    );

    const snapshotItems: CheckoutSnapshotItem[] = Array.from(quantityByProduct.entries()).map(
      ([productId, quantity]) => {
        const dbProduct = priceMap.get(productId);
        return {
          productId,
          quantityPackages: quantity,
          unitPrice: Number(dbProduct?.price ?? 0),
          unitTransportFee: Number(dbProduct?.transport_fee ?? 0),
          packageName: dbProduct?.package_name ?? "pack",
          unitType: dbProduct?.unit_type === "kg" ? "kg" : "pcs",
          unitValue: Number(dbProduct?.unit_value ?? 1),
        };
      },
    );

    // Do not reject based on client-sent total; use verified DB total as source of truth.
    // This prevents false failures when a cart is stale while preserving server-side integrity.
    if (Math.abs(Number(total) - verifiedTotal) > 0.01) {
      console.warn(
        `Client total differs from verified total: sent=${total}, verified=${verifiedTotal}`,
      );
    }

    // Create PayPal order with verified total
    const paypalAmount = Number(verifiedTotal).toFixed(2);
    if (!/^\d+(\.\d{2})$/.test(paypalAmount)) {
      return NextResponse.json(
        { error: "Invalid order amount format. Expected a value like 10.00" },
        { status: 400 },
      );
    }

    const token = await getPaypalToken();
    const merchantEmail = env.paypalMerchantEmail.trim();
    const createResponse = await fetch(
      `${env.paypalBaseUrl}/v2/checkout/orders`,
      {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          intent: "CAPTURE",
          payment_source: {
            paypal: {
              experience_context: {
                user_action: "PAY_NOW",
                shipping_preference: "NO_SHIPPING",
              },
            },
          },
          purchase_units: [
            {
              ...(merchantEmail ? { payee: { email_address: merchantEmail } } : {}),
              amount: {
                currency_code: "USD",
                value: paypalAmount,
              },
            },
          ],
        }),
      },
    );

    if (!createResponse.ok) {
      const errorText = await createResponse.text();
      console.error("PayPal create order error:", errorText);
      const parsedError = (() => {
        try {
          return JSON.parse(errorText) as PayPalApiErrorResponse;
        } catch {
          return null;
        }
      })();

      const detail = parsedError?.details?.[0];
      const formattedMessage = [
        parsedError?.message,
        detail?.issue,
        detail?.description,
      ]
        .filter(Boolean)
        .join(" - ");

      return NextResponse.json(
        { error: formattedMessage || "Failed to create PayPal order" },
        { status: 400 },
      );
    }

    const createPayload = (await createResponse.json()) as PayPalCreateOrderResponse;
    if (!createPayload.id || typeof createPayload.id !== "string") {
      return NextResponse.json(
        { error: "Invalid PayPal order response" },
        { status: 400 },
      );
    }

    const expectedCreateStatuses = new Set([
      "CREATED",
      "PAYER_ACTION_REQUIRED",
      "APPROVED",
    ]);

    if (!expectedCreateStatuses.has(createPayload.status)) {
      console.warn(
        `PayPal create order returned unexpected status: ${createPayload.status}`,
      );
    }

    await query(
      `INSERT INTO paypal_checkout_sessions
       (paypal_order_id, user_id, currency, verified_total, items_json, status, created_at)
       VALUES (?, ?, 'USD', ?, ?, 'created', NOW())
       ON DUPLICATE KEY UPDATE
         user_id = VALUES(user_id),
         verified_total = VALUES(verified_total),
         items_json = VALUES(items_json),
         status = 'created',
         consumed_at = NULL`,
      [
        createPayload.id,
        Number(session.user.id),
        Number(verifiedTotal.toFixed(2)),
        JSON.stringify(snapshotItems),
      ],
    );

    return NextResponse.json({
      orderId: createPayload.id,
      status: createPayload.status,
      total: Number(verifiedTotal).toFixed(2),
    });
  } catch (err) {
    console.error("Create order error:", err);
    return NextResponse.json(
      { error: "Unable to create checkout order. Please try again." },
      { status: 500 },
    );
  }
}
