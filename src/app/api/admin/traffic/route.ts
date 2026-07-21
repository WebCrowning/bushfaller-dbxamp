import { NextResponse } from "next/server";
import { requireAdminApi } from "@/lib/authz";
import { query } from "@/lib/db";

type SummaryRow = {
  totalPageViews: number;
  uniqueVisitors: number;
  avgLoadMs: number | null;
};

type DailyRow = {
  day: string;
  pageViews: number;
  uniqueVisitors: number;
};

type TopPageRow = {
  path: string;
  pageViews: number;
  uniqueVisitors: number;
  avgLoadMs: number | null;
  topCountry: string | null;
};

type ReferrerRow = {
  referrer: string | null;
  count: number;
};

type CountryRow = {
  country: string | null;
  pageViews: number;
  uniqueVisitors: number;
};

type DailyCountryRow = {
  day: string;
  pageViews: number;
  uniqueVisitors: number;
  topCountry: string | null;
};

export async function GET(request: Request) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  try {
    const { searchParams } = new URL(request.url);
    const daysRaw = searchParams.get("days");
    const country = searchParams.get("country") ?? null;
    
    // Support "all" for all-time data
    let days: number | null = null;
    if (daysRaw === "all" || daysRaw === null) {
      days = null; // null means no date filter (all time)
    } else {
      const daysNum = Number(daysRaw ?? 30);
      days = Number.isInteger(daysNum) ? Math.min(Math.max(daysNum, 1), 365) : 30;
    }

    // Build WHERE clause
    const whereConditions: string[] = [];
    const params: (string | number)[] = [];

    if (days !== null) {
      whereConditions.push("created_at >= DATE_SUB(NOW(), INTERVAL ? DAY)");
      params.push(days);
    }

    if (country) {
      whereConditions.push("country = ?");
      params.push(country);
    }

    const whereClause = whereConditions.length > 0 ? `WHERE ${whereConditions.join(" AND ")}` : "";

    const summary = await query<SummaryRow[]>(
      `SELECT
         COUNT(*) AS totalPageViews,
         COUNT(DISTINCT session_key) AS uniqueVisitors,
         ROUND(AVG(load_ms), 0) AS avgLoadMs
       FROM traffic_events
       ${whereClause}`,
      params,
    );

    const daily = await query<DailyCountryRow[]>(
      `SELECT
         DATE(created_at) AS day,
         COUNT(*) AS pageViews,
         COUNT(DISTINCT session_key) AS uniqueVisitors,
         COALESCE(SUBSTRING_INDEX(GROUP_CONCAT(country ORDER BY country), ',', 1), NULL) AS topCountry
       FROM traffic_events
       ${whereClause}
       GROUP BY DATE(created_at)
       ORDER BY day ASC`,
      params,
    );

    const topPages = await query<TopPageRow[]>(
      `SELECT
         path,
         COUNT(*) AS pageViews,
         COUNT(DISTINCT session_key) AS uniqueVisitors,
         ROUND(AVG(load_ms), 0) AS avgLoadMs,
         COALESCE(SUBSTRING_INDEX(GROUP_CONCAT(country ORDER BY country), ',', 1), NULL) AS topCountry
       FROM traffic_events
       ${whereClause}
       GROUP BY path
       ORDER BY pageViews DESC
       LIMIT 12`,
      params,
    );

    const referrers = await query<ReferrerRow[]>(
      `SELECT
         referrer,
         COUNT(*) AS count
       FROM traffic_events
       ${whereClause}${whereClause ? " AND" : "WHERE"} referrer IS NOT NULL
         AND referrer <> ''
       GROUP BY referrer
       ORDER BY count DESC
       LIMIT 8`,
      params,
    );

    // Get list of available countries for filter dropdown
    const countries = await query<CountryRow[]>(
      `SELECT
         country,
         COUNT(*) AS pageViews,
         COUNT(DISTINCT session_key) AS uniqueVisitors
       FROM traffic_events
       WHERE country IS NOT NULL
       GROUP BY country
       ORDER BY pageViews DESC`,
      [],
    );

    return NextResponse.json({
      summary: summary[0] ?? { totalPageViews: 0, uniqueVisitors: 0, avgLoadMs: null },
      daily,
      topPages,
      referrers,
      countries,
      days: days === null ? "all" : days,
      country,
    });
  } catch {
    return NextResponse.json({ error: "Failed to fetch traffic analytics" }, { status: 500 });
  }
}
