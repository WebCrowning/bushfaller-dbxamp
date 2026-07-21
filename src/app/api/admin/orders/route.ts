import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import { requireAdminApi } from "@/lib/authz";

type AdminOrder = {
  id: number;
  public_order_id: string;
  customer_name: string;
  customer_email: string;
  total_price: number;
  status: "Pending" | "Paid" | "Shipped" | "Delivered";
  received_confirmed_at: string | null;
  created_at: string;
  country: string;
  phone: string;
  address: string;
};

export async function GET() {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  try {
    const orders = await query<AdminOrder[]>(
      "SELECT id, public_order_id, customer_name, customer_email, total_price, status, received_confirmed_at, created_at, country, phone, address FROM orders ORDER BY created_at DESC",
    );
    return NextResponse.json({ orders });
  } catch {
    return NextResponse.json({ error: "Failed to fetch orders" }, { status: 500 });
  }
}
