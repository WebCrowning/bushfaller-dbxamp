import type { Metadata } from "next";
import Link from "next/link";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";
import { OrderStatusBadge } from "@/components/order-status-badge";
import { requireUserPage } from "@/lib/authz";
import { query } from "@/lib/db";
import { formatCurrency } from "@/lib/utils";
import type { Order } from "@/types";

export const metadata: Metadata = {
  robots: "noindex, nofollow",
};

export default async function OrdersPage() {
  const session = await requireUserPage();
  const orders = await query<Order[]>(
    "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC",
    [Number(session.user.id)],
  );

  return (
    <div className="min-h-screen">
      <SiteHeader />
      <main className="container-shell py-10">
        <p className="section-kicker">User Dashboard</p>
        <h1 className="section-title mt-2 text-brand-deep">My Orders</h1>

        <div className="mt-6 space-y-4">
          {orders.length === 0 ? (
            <div className="glass-card rounded-2xl p-8 text-center text-sm">No orders yet.</div>
          ) : (
            orders.map((order) => (
              <article key={order.id} className="glass-card rounded-2xl p-5">
                <div className="flex flex-wrap items-center justify-between gap-3">
                  <div>
                    <p className="text-sm font-semibold text-foreground/75">Order {order.public_order_id}</p>
                    <p className="text-xs text-foreground/60">{new Date(order.created_at).toLocaleString()}</p>
                  </div>
                  <OrderStatusBadge status={order.status} />
                </div>
                <div className="mt-4 flex flex-wrap items-center justify-between gap-3">
                  <div>
                    <p className="text-sm font-semibold">Total: {formatCurrency(Number(order.total_price), "USD")}</p>
                    {order.status === "Delivered" ? (
                      <p className="text-xs text-foreground/60">
                        Received confirmation: {order.received_confirmed_at ? "Confirmed" : "Pending"}
                      </p>
                    ) : null}
                  </div>
                  <Link
                    href={`/orders/${order.public_order_id}`}
                    className="inline-flex items-center justify-center rounded-full bg-slate-200 px-4 py-2 text-xs font-bold uppercase tracking-wide text-slate-800 transition-colors hover:bg-slate-300"
                  >
                    View Details
                  </Link>
                </div>
              </article>
            ))
          )}
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
