import type { OrderStatus } from "@/types";

const statusClasses: Record<OrderStatus, string> = {
  Pending: "bg-amber-100 text-amber-800",
  Paid: "bg-emerald-100 text-emerald-800",
  Shipped: "bg-blue-100 text-blue-800",
  Delivered: "bg-slate-800 text-white",
};

export function OrderStatusBadge({ status }: { status: OrderStatus }) {
  return (
    <span className={`rounded-full px-3 py-1 text-xs font-bold ${statusClasses[status]}`}>
      {status}
    </span>
  );
}
