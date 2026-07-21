import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import { requireAdminApi } from "@/lib/authz";

type StatsRow = {
  totalOrders: number;
  revenue: number;
  pendingOrders: number;
  deliveredOrders: number;
  productsCount: number;
  lowStockProducts: number;
  openSupportTickets: number;
  contactMessages: number;
};

type RecentOrderRow = {
  id: number;
  public_order_id: string;
  customer_name: string;
  status: "Pending" | "Paid" | "Shipped" | "Delivered";
  total_price: number;
  created_at: string;
};

export async function GET(request: Request) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  try {
    const { searchParams } = new URL(request.url);
    const startDate = searchParams.get("startDate");
    const endDate = searchParams.get("endDate");

    // Build reusable date condition if provided
    let dateCondition = "";
    const dateParams: unknown[] = [];

    if (startDate && endDate) {
      dateCondition = "created_at >= ? AND created_at <= ?";
      dateParams.push(`${startDate} 00:00:00`, `${endDate} 23:59:59`);
    } else if (startDate) {
      dateCondition = "created_at >= ?";
      dateParams.push(`${startDate} 00:00:00`);
    } else if (endDate) {
      dateCondition = "created_at <= ?";
      dateParams.push(`${endDate} 23:59:59`);
    }

    const baseOrdersWhere = dateCondition ? ` WHERE ${dateCondition}` : "";
    const pendingWhere = dateCondition
      ? ` WHERE status = 'Pending' AND ${dateCondition}`
      : " WHERE status = 'Pending'";
    const deliveredWhere = dateCondition
      ? ` WHERE status = 'Delivered' AND ${dateCondition}`
      : " WHERE status = 'Delivered'";

    // Build query with consistent date filtering
    const statsQuery = `
      SELECT
        (SELECT COUNT(*) FROM orders${baseOrdersWhere}) AS totalOrders,
        (SELECT COALESCE(SUM(total_price), 0) FROM orders${baseOrdersWhere}) AS revenue,
        (SELECT COUNT(*) FROM orders${pendingWhere}) AS pendingOrders,
        (SELECT COUNT(*) FROM orders${deliveredWhere}) AS deliveredOrders,
        (SELECT COUNT(*) FROM products) AS productsCount,
        (SELECT COUNT(*) FROM products WHERE stock_packages <= 5) AS lowStockProducts,
        (SELECT COUNT(*) FROM admin_chat_conversations WHERE status != 'closed') AS openSupportTickets,
        (SELECT COUNT(*) FROM messages WHERE status = 'Open') AS contactMessages
    `;

    // Build params array: 4 queries need date params (totalOrders, revenue, pendingOrders, deliveredOrders)
    const statsParams: unknown[] = [];
    if (dateCondition) {
      // Each of the 4 date-filtered queries needs the same date params
      for (let i = 0; i < 4; i++) {
        statsParams.push(...dateParams);
      }
    }

    const rows = await query<StatsRow[]>(statsQuery, statsParams.length > 0 ? statsParams : undefined);

    // Build recent orders query
    const recentOrdersQuery = `
      SELECT id, public_order_id, customer_name, status, total_price, created_at
      FROM orders${baseOrdersWhere}
      ORDER BY created_at DESC
      LIMIT 6
    `;

    const recentOrders = await query<RecentOrderRow[]>(recentOrdersQuery, dateParams.length > 0 ? dateParams : undefined);

    return NextResponse.json({
      stats: rows[0] ?? {
        totalOrders: 0,
        revenue: 0,
        pendingOrders: 0,
        deliveredOrders: 0,
        productsCount: 0,
        lowStockProducts: 0,
        openSupportTickets: 0,
        contactMessages: 0,
      },
      recentOrders: recentOrders ?? [],
    });
  } catch (err) {
    console.error("Error fetching stats:", err);
    return NextResponse.json(
      { error: "Failed to fetch stats" },
      { status: 500 },
    );
  }
}
