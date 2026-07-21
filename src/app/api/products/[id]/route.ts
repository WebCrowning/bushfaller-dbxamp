import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import { toId } from "@/lib/utils";
import type { Product } from "@/types";

export const dynamic = "force-dynamic";

type Params = {
  params: Promise<{ id: string }>;
};

export async function GET(_: Request, { params }: Params) {
  const { id } = await params;
  const productId = toId(id);

  if (!productId) {
    return NextResponse.json({ error: "Invalid product id" }, { status: 400 });
  }

  try {
    const rows = await query<Product[]>(
      "SELECT id, name, price, transport_fee AS transportFee, image, image_zoom AS imageZoom, description, featured, category, package_name AS packageName, unit_type AS unitType, unit_value AS unitValue, stock_packages AS stockPackages FROM products WHERE id = ? LIMIT 1",
      [productId],
    );

    if (!rows[0]) {
      return NextResponse.json({ error: "Product not found" }, { status: 404 });
    }

    return NextResponse.json({ product: rows[0] });
  } catch {
    return NextResponse.json({ error: "Failed to fetch product" }, { status: 500 });
  }
}
