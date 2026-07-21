import { NextResponse } from "next/server";
import { productSchema } from "@/lib/validation";
import { query } from "@/lib/db";
import { toId } from "@/lib/utils";
import { requireAdminApi } from "@/lib/authz";

type DbResult = {
  affectedRows: number;
};

function normalizeCategory(category: string) {
  const normalized = category.trim().replace(/\s+/g, " ");
  return normalized.length > 0 ? normalized : "General";
}

type Params = {
  params: Promise<{ id: string }>;
};

export async function PUT(request: Request, { params }: Params) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  const { id } = await params;
  const productId = toId(id);
  if (!productId) {
    return NextResponse.json({ error: "Invalid product id" }, { status: 400 });
  }

  const payload = await request.json().catch(() => null);
  const parsed = productSchema.safeParse(payload);

  if (!parsed.success) {
    return NextResponse.json({ error: parsed.error.flatten() }, { status: 400 });
  }

  try {
    const category = normalizeCategory(parsed.data.category);

    const result = await query<DbResult>(
      `UPDATE products
       SET name = ?, price = ?, transport_fee = ?, image = ?, image_zoom = ?, description = ?, featured = ?, category = ?, package_name = ?, unit_type = ?, unit_value = ?, stock_packages = ?
       WHERE id = ?`,
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
        productId,
      ],
    );

    if ((result as unknown as DbResult).affectedRows === 0) {
      return NextResponse.json({ error: "Product not found" }, { status: 404 });
    }

    return NextResponse.json({ ok: true });
  } catch {
    return NextResponse.json({ error: "Failed to update product" }, { status: 500 });
  }
}

export async function DELETE(_: Request, { params }: Params) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  const { id } = await params;
  const productId = toId(id);
  if (!productId) {
    return NextResponse.json({ error: "Invalid product id" }, { status: 400 });
  }

  try {
    await query("DELETE FROM products WHERE id = ?", [productId]);
    return NextResponse.json({ ok: true });
  } catch {
    return NextResponse.json({ error: "Failed to delete product" }, { status: 500 });
  }
}
