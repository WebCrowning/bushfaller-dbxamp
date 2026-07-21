import { NextResponse } from "next/server";
import { env, getRequiredEnv } from "@/lib/env";
import { query } from "@/lib/db";

type PayPalWebhookEvent = {
  id: string;
  event_type: string;
  resource?: {
    id?: string;
    supplementary_data?: {
      related_ids?: {
        order_id?: string;
      };
    };
  };
};

type VerifyWebhookResponse = {
  verification_status?: "SUCCESS" | "FAILURE";
};

type ExistingWebhookEvent = {
  id: number;
};

type MatchingOrderRow = {
  id: number;
};

function getHeader(headers: Headers, key: string) {
  return headers.get(key) ?? headers.get(key.toLowerCase()) ?? "";
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
    throw new Error("Failed to get PayPal token");
  }

  const payload = (await response.json()) as { access_token: string };
  return payload.access_token;
}

async function verifyWebhookSignature(
  token: string,
  request: Request,
  eventBody: PayPalWebhookEvent,
) {
  const webhookId = getRequiredEnv("PAYPAL_WEBHOOK_ID", env.paypalWebhookId);

  const transmissionId = getHeader(request.headers, "paypal-transmission-id");
  const transmissionTime = getHeader(request.headers, "paypal-transmission-time");
  const transmissionSig = getHeader(request.headers, "paypal-transmission-sig");
  const certUrl = getHeader(request.headers, "paypal-cert-url");
  const authAlgo = getHeader(request.headers, "paypal-auth-algo");

  if (!transmissionId || !transmissionTime || !transmissionSig || !certUrl || !authAlgo) {
    return false;
  }

  const verifyResponse = await fetch(
    `${env.paypalBaseUrl}/v1/notifications/verify-webhook-signature`,
    {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        auth_algo: authAlgo,
        cert_url: certUrl,
        transmission_id: transmissionId,
        transmission_sig: transmissionSig,
        transmission_time: transmissionTime,
        webhook_id: webhookId,
        webhook_event: eventBody,
      }),
    },
  );

  if (!verifyResponse.ok) {
    return false;
  }

  const verifyPayload = (await verifyResponse.json()) as VerifyWebhookResponse;
  return verifyPayload.verification_status === "SUCCESS";
}

export async function POST(request: Request) {
  try {
    const rawBody = await request.text();
    const event = JSON.parse(rawBody) as PayPalWebhookEvent;

    if (!event?.id || !event.event_type) {
      return NextResponse.json({ error: "Invalid webhook payload" }, { status: 400 });
    }

    const token = await getPaypalToken();
    const signatureValid = await verifyWebhookSignature(token, request, event);

    if (!signatureValid) {
      return NextResponse.json({ error: "Invalid webhook signature" }, { status: 400 });
    }

    const existingEvent = await query<ExistingWebhookEvent[]>(
      "SELECT id FROM paypal_webhook_events WHERE event_id = ? LIMIT 1",
      [event.id],
    );

    if (existingEvent.length > 0) {
      return NextResponse.json({ ok: true, duplicate: true });
    }

    const captureId = event.resource?.id ?? null;
    const paypalOrderId = event.resource?.supplementary_data?.related_ids?.order_id ?? null;

    let reconciliationStatus: "processed" | "unmatched" = "processed";
    let matchedOrderId: number | null = null;

    if (event.event_type === "PAYMENT.CAPTURE.COMPLETED") {
      const matchingOrders = await query<MatchingOrderRow[]>(
        `SELECT id
         FROM orders
         WHERE paypal_transaction_id = ? OR paypal_order_id = ?
         LIMIT 1`,
        [captureId, paypalOrderId],
      );

      if (matchingOrders.length > 0) {
        matchedOrderId = matchingOrders[0].id;
        await query(
          "UPDATE orders SET status = 'Paid' WHERE id = ?",
          [matchedOrderId],
        );
      } else {
        reconciliationStatus = "unmatched";
      }
    }

    await query(
      `INSERT INTO paypal_webhook_events
       (event_id, event_type, resource_id, paypal_order_id, payload, reconciliation_status, matched_order_id, processed_at, created_at)
       VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [
        event.id,
        event.event_type,
        captureId,
        paypalOrderId,
        rawBody,
        reconciliationStatus,
        matchedOrderId,
      ],
    );

    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("PayPal webhook error:", error);
    return NextResponse.json({ error: "Webhook processing failed" }, { status: 500 });
  }
}
