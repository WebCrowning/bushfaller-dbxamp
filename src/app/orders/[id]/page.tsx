import Link from "next/link";
import { notFound } from "next/navigation";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";
import { OrderStatusBadge } from "@/components/order-status-badge";
import { requireUserPage } from "@/lib/authz";
import { query } from "@/lib/db";
import { isOrderReference } from "@/lib/order-reference";
import { formatCurrency } from "@/lib/utils";
import type { Order, OrderItem } from "@/types";
import { Check, Package, Truck, MapPin, ArrowLeft } from "lucide-react";
import { ConfirmReceivedButton } from "@/components/confirm-received-button";

type Params = {
  params: Promise<{ id: string }>;
};

export default async function OrderDetailsPage({ params }: Params) {
  const session = await requireUserPage();
  const { id } = await params;
  const orderRef = id.toUpperCase();

  if (!isOrderReference(orderRef)) {
    notFound();
  }

  const rawUserId = Number(session.user?.id);
  const userId = !isNaN(rawUserId) && rawUserId > 0 ? rawUserId : 0;
  const userEmail = session.user?.email ?? "";

  const orders = await query<Order[]>(
    "SELECT * FROM orders WHERE public_order_id = ? AND (user_id = ? OR customer_email = ?) LIMIT 1",
    [orderRef, userId, userEmail],
  );

  const order = orders[0];
  if (!order) {
    notFound();
  }

  const items = await query<OrderItem[]>(
    `SELECT oi.id, oi.order_id, oi.product_id, oi.quantity_packages, oi.unit_type, oi.unit_value, oi.package_name, oi.price, oi.transport_fee,
            oi.product_name_snapshot AS name,
            oi.product_image_snapshot AS image
     FROM order_items oi
     WHERE oi.order_id = ?`,
    [order.id],
  );

  return (
    <div className="min-h-screen bg-gradient-to-b from-brand/5 to-transparent">
      <SiteHeader />
      <main className="container-shell py-8">
        {/* Header */}
        <Link href="/orders" className="inline-flex items-center gap-2 text-sm font-semibold text-brand hover:text-brand-deep mb-6">
          <ArrowLeft className="h-4 w-4" /> Back to orders
        </Link>

        {/* Order Info */}
        <div className="mb-8">
          <div className="flex items-start justify-between gap-4 mb-4">
            <div>
              <h1 className="text-4xl font-bold text-brand-deep mb-2">Order {order.public_order_id}</h1>
              <p className="text-foreground/60">Placed on {new Date(order.created_at).toLocaleDateString()}</p>
            </div>
            <OrderStatusBadge status={order.status} />
          </div>

          <div className="grid gap-4 sm:grid-cols-2">
            <div className="rounded-xl border border-border/50 bg-white p-5">
              <p className="text-xs font-semibold uppercase tracking-widest text-foreground/50">Delivery Address</p>
              <div className="mt-3 space-y-1 text-sm">
                <p className="font-semibold text-foreground/90">{order.customer_name}</p>
                <p className="text-foreground/70">{order.address}</p>
                <p className="text-foreground/70">{order.country}</p>
                <p className="text-foreground/70 font-mono text-xs">{order.phone}</p>
              </div>
            </div>
            <div className="rounded-xl border border-border/50 bg-white p-5">
              <p className="text-xs font-semibold uppercase tracking-widest text-foreground/50">Order Summary</p>
              <div className="mt-3 space-y-2 text-sm">
                <div className="flex justify-between">
                  <span className="text-foreground/70">Items:</span>
                  <span className="font-semibold">{items.length}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-foreground/70">Total:</span>
                  <span className="font-bold text-brand-deep text-lg">{formatCurrency(Number(order.total_price), "USD")}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-foreground/70">Received Confirmation:</span>
                  <span className="font-semibold">
                    {order.received_confirmed_at ? "Confirmed" : "Pending"}
                  </span>
                </div>
              </div>
            </div>
          </div>

          {order.status === "Delivered" ? (
            <div className="mt-4">
              {order.received_confirmed_at ? (
                <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-4 text-sm text-emerald-900">
                  Package receipt confirmed on {new Date(order.received_confirmed_at).toLocaleString()}.
                </div>
              ) : (
                <ConfirmReceivedButton orderId={order.public_order_id} />
              )}
            </div>
          ) : null}
        </div>

        {/* Status Timeline */}
        <section className="mb-10 rounded-2xl border border-border/50 bg-white p-8 shadow-sm">
          <h2 className="mb-8 text-2xl font-bold text-brand-deep">Shipment Status</h2>
          
          <div className="space-y-4">
            {/* Timeline Items */}
            <div className="flex gap-4">
              {/* Pending */}
              <div className="flex flex-col items-center">
                <div className={`flex h-12 w-12 items-center justify-center rounded-full border-2 ${order.status !== "Pending" ? "border-green-500 bg-green-100" : "border-brand bg-brand/10"}`}>
                  <Package className={`h-6 w-6 ${order.status !== "Pending" ? "text-green-600" : "text-brand"}`} />
                </div>
                <div className={`mt-2 h-12 w-1 ${order.status !== "Pending" ? "bg-green-500" : "bg-border/30"}`}></div>
              </div>
              <div className="pb-4">
                <p className={`font-bold ${order.status !== "Pending" ? "text-green-600" : "text-foreground/50"}`}>Order Placed</p>
                <p className="text-sm text-foreground/60">{new Date(order.created_at).toLocaleDateString()}</p>
              </div>
            </div>

            {/* Paid */}
            <div className="flex gap-4">
              <div className="flex flex-col items-center">
                <div className={`flex h-12 w-12 items-center justify-center rounded-full border-2 ${(order.status === "Paid" || order.status === "Shipped" || order.status === "Delivered") ? "border-green-500 bg-green-100" : "border-border bg-surface"}`}>
                  <Check className={`h-6 w-6 ${(order.status === "Paid" || order.status === "Shipped" || order.status === "Delivered") ? "text-green-600" : "text-foreground/30"}`} />
                </div>
                <div className={`mt-2 h-12 w-1 ${(order.status === "Shipped" || order.status === "Delivered") ? "bg-green-500" : "bg-border/30"}`}></div>
              </div>
              <div className="pb-4">
                <p className={`font-bold ${(order.status === "Paid" || order.status === "Shipped" || order.status === "Delivered") ? "text-green-600" : "text-foreground/50"}`}>Payment Confirmed</p>
                <p className="text-sm text-foreground/60">{order.status !== "Pending" ? "✓ Verified" : "Awaiting verification"}</p>
              </div>
            </div>

            {/* Shipped */}
            <div className="flex gap-4">
              <div className="flex flex-col items-center">
                <div className={`flex h-12 w-12 items-center justify-center rounded-full border-2 ${(order.status === "Shipped" || order.status === "Delivered") ? "border-blue-500 bg-blue-100" : "border-border bg-surface"}`}>
                  <Truck className={`h-6 w-6 ${(order.status === "Shipped" || order.status === "Delivered") ? "text-blue-600" : "text-foreground/30"}`} />
                </div>
                <div className={`mt-2 h-12 w-1 ${order.status === "Delivered" ? "bg-green-500" : "bg-border/30"}`}></div>
              </div>
              <div className="pb-4">
                <p className={`font-bold ${(order.status === "Shipped" || order.status === "Delivered") ? "text-blue-600" : "text-foreground/50"}`}>On the Way</p>
                <p className="text-sm text-foreground/60">{order.status !== "Pending" && order.status !== "Paid" ? "✓ Shipped & in transit" : "Preparing to ship"}</p>
              </div>
            </div>

            {/* Delivered */}
            <div className="flex gap-4">
              <div className="flex flex-col items-center">
                <div className={`flex h-12 w-12 items-center justify-center rounded-full border-2 ${order.status === "Delivered" ? "border-green-500 bg-green-100" : "border-border bg-surface"}`}>
                  <MapPin className={`h-6 w-6 ${order.status === "Delivered" ? "text-green-600" : "text-foreground/30"}`} />
                </div>
              </div>
              <div>
                <p className={`font-bold ${order.status === "Delivered" ? "text-green-600" : "text-foreground/50"}`}>Delivered</p>
                <p className="text-sm text-foreground/60">{order.status === "Delivered" ? "✓ Order received" : "Expected soon"}</p>
              </div>
            </div>
          </div>
        </section>

        {/* Order Items */}
        <section className="rounded-2xl border border-border/50 bg-white p-8 shadow-sm">
          <h2 className="mb-6 text-2xl font-bold text-brand-deep">Items Ordered</h2>
          
          <div className="space-y-3">
            {items.map((item) => (
              <div key={item.id} className="rounded-xl border border-border/30 bg-gradient-to-r from-surface/50 to-transparent p-4 hover:border-brand/30 transition-colors">
                <div className="flex gap-4">
                  {/* Product Image */}
                  <div className="flex-shrink-0">
                    <div className="h-24 w-24 rounded-lg bg-surface border border-border/50 overflow-hidden">
                      {item.image && (
                        <img 
                          src={item.image} 
                          alt={item.name}
                          className="h-full w-full object-cover"
                        />
                      )}
                    </div>
                  </div>

                  {/* Product Details */}
                  <div className="flex-1 min-w-0">
                    <p className="font-bold text-foreground/90 text-lg">{item.name}</p>
                    <p className="text-sm text-foreground/60 mt-1">Quantity: <span className="font-semibold">{item.quantity_packages} {item.package_name ?? "pack"}{item.quantity_packages > 1 ? "s" : ""}</span></p>
                    <p className="text-xs text-foreground/50 mt-1">Total units: {Number(item.quantity_packages) * Number(item.unit_value)} {item.unit_type}</p>
                    <div className="mt-3 flex justify-between items-center">
                      <div>
                        <p className="text-xs text-foreground/50">Unit Price</p>
                        <p className="font-semibold text-brand-deep">{formatCurrency(Number(item.price), "USD")}</p>
                        <p className="mt-1 text-xs text-foreground/60">
                          Transport Fee: {formatCurrency(Number(item.transport_fee ?? 0), "USD")}
                        </p>
                      </div>
                      <div className="text-right">
                        <p className="text-xs text-foreground/50">Subtotal (incl. transport)</p>
                        <p className="font-bold text-brand-deep text-lg">
                          {formatCurrency(
                            (Number(item.price) + Number(item.transport_fee ?? 0)) * item.quantity_packages,
                            "USD",
                          )}
                        </p>
                      </div>
                    </div>
                  </div>

                  {/* Item Status */}
                  <div className="flex-shrink-0">
                    <div className={`px-4 py-2 rounded-lg font-semibold text-sm text-center ${
                      order.status === "Delivered" ? "bg-green-100 text-green-700" :
                      order.status === "Shipped" ? "bg-blue-100 text-blue-700" :
                      order.status === "Paid" ? "bg-yellow-100 text-yellow-700" :
                      "bg-gray-100 text-gray-700"
                    }`}>
                      {order.status === "Delivered" ? "✓ Delivered" :
                       order.status === "Shipped" ? "📦 Shipped" :
                       order.status === "Paid" ? "✓ Paid" :
                       "Pending"}
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>

          <div className="mt-8 border-t border-border/30 pt-6">
            <div className="flex justify-between items-center text-lg">
              <span className="font-bold text-foreground/80">Total Amount:</span>
              <span className="font-bold text-2xl text-brand-deep">{formatCurrency(Number(order.total_price), "USD")}</span>
            </div>
          </div>
        </section>
      </main>
      <SiteFooter />
    </div>
  );
}
