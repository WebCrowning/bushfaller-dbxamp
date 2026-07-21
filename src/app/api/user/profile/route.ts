import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";

type UserRow = {
  id: number;
  name: string;
  email: string;
  created_at: string;
  phone_country_code: string | null;
  phone_number: string | null;
  default_country: string | null;
  default_address_line1: string | null;
  default_address_line2: string | null;
  default_city: string | null;
  default_state_province: string | null;
  default_postal_code: string | null;
  default_delivery_note: string | null;
};

type DbResult = {
  affectedRows: number;
};

function isMissingShippingColumnError(error: unknown) {
  if (!error || typeof error !== "object") {
    return false;
  }

  const maybeCode = "code" in error ? String(error.code ?? "") : "";
  const maybeMessage = "message" in error ? String(error.message ?? "") : "";

  return (
    maybeCode === "ER_BAD_FIELD_ERROR" ||
    /unknown column/i.test(maybeMessage)
  );
}

function toUserId(rawId: string | undefined) {
  const id = Number(rawId ?? "0");
  if (!Number.isInteger(id) || id <= 0) {
    return null;
  }
  return id;
}

export async function GET() {
  const session = await auth();
  const userId = toUserId(session?.user?.id);

  if (!userId) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  try {
    const rows = await query<UserRow[]>(
      `SELECT id, name, email, created_at,
              phone_country_code, phone_number,
              default_country, default_address_line1, default_address_line2,
              default_city, default_state_province, default_postal_code, default_delivery_note
       FROM users WHERE id = ? LIMIT 1`,
      [userId],
    );

    const user = rows[0];
    if (!user) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }

    return NextResponse.json({
      profile: {
        id: user.id,
        name: user.name,
        email: user.email,
        createdAt: user.created_at,
        phoneCountryCode: user.phone_country_code ?? "",
        phoneNumber: user.phone_number ?? "",
        country: user.default_country ?? "",
        addressLine1: user.default_address_line1 ?? "",
        addressLine2: user.default_address_line2 ?? "",
        city: user.default_city ?? "",
        stateProvince: user.default_state_province ?? "",
        postalCode: user.default_postal_code ?? "",
        deliveryNote: user.default_delivery_note ?? "",
      },
    });
  } catch (error) {
    if (!isMissingShippingColumnError(error)) {
      return NextResponse.json({ error: "Failed to load profile" }, { status: 500 });
    }

    try {
      const legacyRows = await query<Array<Pick<UserRow, "id" | "name" | "email" | "created_at">>>(
        "SELECT id, name, email, created_at FROM users WHERE id = ? LIMIT 1",
        [userId],
      );

      const user = legacyRows[0];
      if (!user) {
        return NextResponse.json({ error: "User not found" }, { status: 404 });
      }

      return NextResponse.json({
        profile: {
          id: user.id,
          name: user.name,
          email: user.email,
          createdAt: user.created_at,
          phoneCountryCode: "",
          phoneNumber: "",
          country: "",
          addressLine1: "",
          addressLine2: "",
          city: "",
          stateProvince: "",
          postalCode: "",
          deliveryNote: "",
        },
      });
    } catch {
      return NextResponse.json({ error: "Failed to load profile" }, { status: 500 });
    }
  }
}

export async function PUT(request: Request) {
  const session = await auth();
  const userId = toUserId(session?.user?.id);

  if (!userId) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const payload = (await request.json().catch(() => null)) as {
    name?: string;
    phoneCountryCode?: string;
    phoneNumber?: string;
    country?: string;
    addressLine1?: string;
    addressLine2?: string;
    city?: string;
    stateProvince?: string;
    postalCode?: string;
    deliveryNote?: string;
  } | null;
  const name = String(payload?.name ?? "").trim();
  const phoneCountryCode = String(payload?.phoneCountryCode ?? "").trim();
  const phoneNumber = String(payload?.phoneNumber ?? "").trim();
  const country = String(payload?.country ?? "").trim();
  const addressLine1 = String(payload?.addressLine1 ?? "").trim();
  const addressLine2 = String(payload?.addressLine2 ?? "").trim();
  const city = String(payload?.city ?? "").trim();
  const stateProvince = String(payload?.stateProvince ?? "").trim();
  const postalCode = String(payload?.postalCode ?? "").trim();
  const deliveryNote = String(payload?.deliveryNote ?? "").trim();

  if (name.length < 2 || name.length > 120) {
    return NextResponse.json(
      { error: "Name must be between 2 and 120 characters" },
      { status: 400 },
    );
  }

  if (phoneCountryCode && !/^\+\d{1,4}$/.test(phoneCountryCode)) {
    return NextResponse.json(
      { error: "Phone country code must look like +237" },
      { status: 400 },
    );
  }

  if (phoneNumber && (phoneNumber.length < 6 || phoneNumber.length > 40)) {
    return NextResponse.json(
      { error: "Phone number must be between 6 and 40 characters" },
      { status: 400 },
    );
  }

  if (country && country.length > 80) {
    return NextResponse.json(
      { error: "Country is too long" },
      { status: 400 },
    );
  }

  if (addressLine1 && addressLine1.length > 255) {
    return NextResponse.json(
      { error: "Address line 1 is too long" },
      { status: 400 },
    );
  }

  if (addressLine2 && addressLine2.length > 255) {
    return NextResponse.json(
      { error: "Address line 2 is too long" },
      { status: 400 },
    );
  }

  if (city && city.length > 120) {
    return NextResponse.json(
      { error: "City is too long" },
      { status: 400 },
    );
  }

  if (stateProvince && stateProvince.length > 120) {
    return NextResponse.json(
      { error: "State/Province/Region is too long" },
      { status: 400 },
    );
  }

  if (postalCode && postalCode.length > 30) {
    return NextResponse.json(
      { error: "Postal code is too long" },
      { status: 400 },
    );
  }

  if (deliveryNote.length > 1000) {
    return NextResponse.json(
      { error: "Delivery note is too long" },
      { status: 400 },
    );
  }

  try {
    const result = await query<DbResult>(
      `UPDATE users
       SET name = ?,
           phone_country_code = ?,
           phone_number = ?,
           default_country = ?,
           default_address_line1 = ?,
           default_address_line2 = ?,
           default_city = ?,
           default_state_province = ?,
           default_postal_code = ?,
           default_delivery_note = ?
       WHERE id = ?`,
      [
        name,
        phoneCountryCode || null,
        phoneNumber || null,
        country || null,
        addressLine1 || null,
        addressLine2 || null,
        city || null,
        stateProvince || null,
        postalCode || null,
        deliveryNote || null,
        userId,
      ],
    );

    if ((result as unknown as DbResult).affectedRows === 0) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }

    return NextResponse.json({ ok: true });
  } catch (error) {
    if (!isMissingShippingColumnError(error)) {
      return NextResponse.json({ error: "Failed to update profile" }, { status: 500 });
    }

    try {
      const legacyResult = await query<DbResult>(
        "UPDATE users SET name = ? WHERE id = ?",
        [name, userId],
      );

      if ((legacyResult as unknown as DbResult).affectedRows === 0) {
        return NextResponse.json({ error: "User not found" }, { status: 404 });
      }

      return NextResponse.json({ ok: true });
    } catch {
      return NextResponse.json({ error: "Failed to update profile" }, { status: 500 });
    }
  }
}
