import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import type { Product } from "@/types";

export const dynamic = "force-dynamic";

export async function GET() {
  try {
    const products = await query<Product[]>(
      "SELECT id, name, price, transport_fee AS transportFee, image, image_zoom AS imageZoom, description, featured, category, package_name AS packageName, unit_type AS unitType, unit_value AS unitValue, stock_packages AS stockPackages FROM products ORDER BY id DESC",
    );
    return NextResponse.json({ products });
  } catch {
    return NextResponse.json({ error: "Failed to fetch products" }, { status: 500 });
  }
}
