import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import { sendOrderStatusChangedEmails } from "@/lib/email";
import { createUserNotification } from "@/lib/notifications";
import { orderStatusSchema } from "@/lib/validation";
import { toId } from "@/lib/utils";
import { requireAdminApi } from "@/lib/authz";

type Params = {
  params: Promise<{ id: string }>;
};

export async function PATCH(request: Request, { params }: Params) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  const { id } = await params;
  const orderId = toId(id);
  if (!orderId) {
    return NextResponse.json({ error: "Invalid order id" }, { status: 400 });
  }

  const payload = await request.json().catch(() => null);
  const parsed = orderStatusSchema.safeParse(payload);

  if (!parsed.success) {
    return NextResponse.json({ error: parsed.error.flatten() }, { status: 400 });
  }

  try {
    const rows = await query<Array<{ user_id: number; status: string; customer_name: string; customer_email: string; public_order_id: string }>>(
      "SELECT user_id, status, customer_name, customer_email, public_order_id FROM orders WHERE id = ? LIMIT 1",
      [orderId],
    );

    if (!rows[0]) {
      return NextResponse.json({ error: "Order not found" }, { status: 404 });
    }

    await query(
      "UPDATE orders SET status = ?, received_confirmed_at = CASE WHEN ? = 'Delivered' THEN received_confirmed_at ELSE NULL END WHERE id = ?",
      [parsed.data.status, parsed.data.status, orderId],
    );

    if (rows[0].status !== parsed.data.status) {
      await createUserNotification(rows[0].user_id, {
        type: "order",
        title: `Order ${rows[0].public_order_id} status updated`,
        body: `Your order is now marked as ${parsed.data.status}.`,
        link: `/orders/${rows[0].public_order_id}`,
      });

      await sendOrderStatusChangedEmails({
        orderId: rows[0].public_order_id,
        customerName: rows[0].customer_name,
        customerEmail: rows[0].customer_email,
        newStatus: parsed.data.status,
      });
    }

    return NextResponse.json({ ok: true });
  } catch {
    return NextResponse.json({ error: "Failed to update order status" }, { status: 500 });
  }
}
