import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import { productSchema } from "@/lib/validation";
import { requireAdminApi } from "@/lib/authz";
import type { Product } from "@/types";

function normalizeCategory(category: string) {
  const normalized = category.trim().replace(/\s+/g, " ");
  return normalized.length > 0 ? normalized : "General";
}

export async function GET() {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  try {
    const [products, categories] = await Promise.all([
      query<Product[]>(
        "SELECT id, name, price, transport_fee AS transportFee, image, image_zoom AS imageZoom, description, featured, category, package_name AS packageName, unit_type AS unitType, unit_value AS unitValue, stock_packages AS stockPackages FROM products ORDER BY created_at DESC",
      ),
      query<Array<{ category: string }>>(
        "SELECT DISTINCT category FROM products WHERE category IS NOT NULL AND TRIM(category) != '' ORDER BY category ASC",
      ),
    ]);

    return NextResponse.json({
      products,
      categories: categories.map((row) => row.category),
    });
  } catch {
    return NextResponse.json({ error: "Failed to fetch products" }, { status: 500 });
  }
}

export async function POST(request: Request) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  const payload = await request.json().catch(() => null);
  const parsed = productSchema.safeParse(payload);

  if (!parsed.success) {
    return NextResponse.json({ error: parsed.error.flatten() }, { status: 400 });
  }

  try {
    const category = normalizeCategory(parsed.data.category);

    await query(
      `INSERT INTO products (name, price, transport_fee, image, image_zoom, description, featured, category, package_name, unit_type, unit_value, stock_packages)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        parsed.data.name,
        parsed.data.price,
        parsed.data.transportFee,
        parsed.data.image,
        parsed.data.imageZoom,
        parsed.data.description,
        parsed.data.featured,
        category,
        parsed.data.packageName,
        parsed.data.unitType,
        parsed.data.unitValue,
        parsed.data.stockPackages,
      ],
    );

    return NextResponse.json({ ok: true }, { status: 201 });
  } catch {
    return NextResponse.json({ error: "Failed to create product" }, { status: 500 });
  }
}
