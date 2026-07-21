"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import { formatCurrency } from "@/lib/utils";

type InventorySummary = {
  totalProducts: number;
  inStockProducts: number;
  lowStockProducts: number;
  outOfStockProducts: number;
  totalPackagesAvailable: number;
};

type InventoryProduct = {
  id: number;
  name: string;
  category: string;
  price: number;
  stockPackages: number;
  packageName: "pack" | "bag" | "bundle" | "carton";
  unitType: "kg" | "pcs";
  unitValue: number;
  featured: number;
};

const EMPTY_SUMMARY: InventorySummary = {
  totalProducts: 0,
  inStockProducts: 0,
  lowStockProducts: 0,
  outOfStockProducts: 0,
  totalPackagesAvailable: 0,
};

type StockFilter = "all" | "instock" | "low" | "out";

export default function AdminInventoryPage() {
  const [loading, setLoading] = useState(true);
  const [summary, setSummary] = useState<InventorySummary>(EMPTY_SUMMARY);
  const [products, setProducts] = useState<InventoryProduct[]>([]);
  const [queryText, setQueryText] = useState("");
  const [filter, setFilter] = useState<StockFilter>("all");

  useEffect(() => {
    let active = true;

    async function loadInventory() {
      setLoading(true);
      try {
        const response = await fetch("/api/admin/inventory", { cache: "no-store" });
        if (!response.ok) {
          throw new Error("Failed to fetch inventory");
        }

        const payload = (await response.json().catch(() => null)) as
          | { summary?: InventorySummary; products?: InventoryProduct[] }
          | null;

        if (!active) {
          return;
        }

        setSummary(payload?.summary ?? EMPTY_SUMMARY);
        setProducts(Array.isArray(payload?.products) ? payload.products : []);
      } catch {
        if (!active) {
          return;
        }

        setSummary(EMPTY_SUMMARY);
        setProducts([]);
      } finally {
        if (active) {
          setLoading(false);
        }
      }
    }

    void loadInventory();

    return () => {
      active = false;
    };
  }, []);

  const filteredProducts = useMemo(() => {
    const q = queryText.trim().toLowerCase();

    return products.filter((product) => {
      const matchesQuery =
        q.length === 0 ||
        product.name.toLowerCase().includes(q) ||
        product.category.toLowerCase().includes(q);

      const matchesFilter =
        filter === "all" ||
        (filter === "instock" && product.stockPackages > 5) ||
        (filter === "low" && product.stockPackages > 0 && product.stockPackages <= 5) ||
        (filter === "out" && product.stockPackages === 0);

      return matchesQuery && matchesFilter;
    });
  }, [products, queryText, filter]);

  function stockBadge(stockPackages: number) {
    if (stockPackages === 0) {
      return "bg-red-100 text-red-700 border-red-200";
    }
    if (stockPackages <= 5) {
      return "bg-amber-100 text-amber-700 border-amber-200";
    }
    return "bg-emerald-100 text-emerald-700 border-emerald-200";
  }

  function stockLabel(stockPackages: number) {
    if (stockPackages === 0) {
      return "Out of stock";
    }
    if (stockPackages <= 5) {
      return "Low stock";
    }
    return "In stock";
  }

  return (
    <div className="space-y-5">
      <section className="rounded-2xl border border-border bg-white p-5 shadow-sm">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div>
            <p className="text-xs font-semibold uppercase tracking-[0.14em] text-foreground/60">Inventory Monitor</p>
            <h2 className="mt-1 text-2xl font-extrabold text-brand-deep">Product Availability Control</h2>
            <p className="mt-2 text-sm text-foreground/70">
              Track package stock levels, identify low inventory, and jump directly to product updates.
            </p>
          </div>
          <div className="flex gap-2">
            <Link
              href="/admin/products"
              className="rounded-full border border-border px-4 py-2 text-sm font-semibold hover:bg-surface-soft"
            >
              Manage Products
            </Link>
            <button
              type="button"
              onClick={() => window.location.reload()}
              className="rounded-full bg-brand px-4 py-2 text-sm font-semibold text-white hover:bg-brand-deep"
            >
              Refresh
            </button>
          </div>
        </div>
      </section>

      <section className="grid gap-3 sm:grid-cols-2 xl:grid-cols-5">
        <article className="rounded-2xl border border-border bg-white p-4 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">Products</p>
          <p className="mt-1 text-2xl font-extrabold text-brand-deep">{loading ? "..." : summary.totalProducts}</p>
        </article>
        <article className="rounded-2xl border border-border bg-white p-4 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">In stock</p>
          <p className="mt-1 text-2xl font-extrabold text-emerald-600">{loading ? "..." : summary.inStockProducts}</p>
        </article>
        <article className="rounded-2xl border border-border bg-white p-4 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">Low stock</p>
          <p className="mt-1 text-2xl font-extrabold text-amber-600">{loading ? "..." : summary.lowStockProducts}</p>
        </article>
        <article className="rounded-2xl border border-border bg-white p-4 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">Out of stock</p>
          <p className="mt-1 text-2xl font-extrabold text-red-600">{loading ? "..." : summary.outOfStockProducts}</p>
        </article>
        <article className="rounded-2xl border border-border bg-white p-4 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">Total packages</p>
          <p className="mt-1 text-2xl font-extrabold text-brand-deep">{loading ? "..." : summary.totalPackagesAvailable}</p>
        </article>
      </section>

      <section className="rounded-2xl border border-border bg-white p-5 shadow-sm">
        <div className="mb-4 flex flex-wrap items-center gap-2">
          <input
            type="search"
            placeholder="Search by product or category"
            value={queryText}
            onChange={(e) => setQueryText(e.target.value)}
            className="min-w-60 flex-1 rounded-xl border border-border bg-surface px-4 py-2 text-sm"
          />
          <button
            type="button"
            onClick={() => setFilter("all")}
            className={`rounded-full px-3 py-1.5 text-xs font-semibold ${
              filter === "all" ? "bg-brand text-white" : "border border-border hover:bg-surface-soft"
            }`}
          >
            All
          </button>
          <button
            type="button"
            onClick={() => setFilter("instock")}
            className={`rounded-full px-3 py-1.5 text-xs font-semibold ${
              filter === "instock" ? "bg-emerald-600 text-white" : "border border-border hover:bg-surface-soft"
            }`}
          >
            In stock
          </button>
          <button
            type="button"
            onClick={() => setFilter("low")}
            className={`rounded-full px-3 py-1.5 text-xs font-semibold ${
              filter === "low" ? "bg-amber-500 text-white" : "border border-border hover:bg-surface-soft"
            }`}
          >
            Low stock
          </button>
          <button
            type="button"
            onClick={() => setFilter("out")}
            className={`rounded-full px-3 py-1.5 text-xs font-semibold ${
              filter === "out" ? "bg-red-600 text-white" : "border border-border hover:bg-surface-soft"
            }`}
          >
            Out of stock
          </button>
        </div>

        {loading ? (
          <p className="rounded-xl border border-border bg-surface p-4 text-sm text-foreground/70">Loading inventory...</p>
        ) : filteredProducts.length === 0 ? (
          <p className="rounded-xl border border-border bg-surface p-4 text-sm text-foreground/70">No products match this filter.</p>
        ) : (
          <div className="overflow-x-auto">
            <table className="min-w-full text-sm">
              <thead>
                <tr className="border-b border-border text-left text-xs uppercase tracking-wide text-foreground/60">
                  <th className="px-2 py-2">Product</th>
                  <th className="px-2 py-2">Category</th>
                  <th className="px-2 py-2">Price</th>
                  <th className="px-2 py-2">Package</th>
                  <th className="px-2 py-2">Stock</th>
                  <th className="px-2 py-2">Status</th>
                  <th className="px-2 py-2">Action</th>
                </tr>
              </thead>
              <tbody>
                {filteredProducts.map((product) => (
                  <tr key={product.id} className="border-b border-border/70 last:border-b-0">
                    <td className="px-2 py-3 font-semibold text-foreground/85">{product.name}</td>
                    <td className="px-2 py-3 text-foreground/70">{product.category}</td>
                    <td className="px-2 py-3 text-foreground/70">{formatCurrency(Number(product.price), "USD")}</td>
                    <td className="px-2 py-3 text-foreground/70">
                      {product.packageName} ({Number(product.unitValue)} {product.unitType})
                    </td>
                    <td className="px-2 py-3 text-foreground/80">{product.stockPackages} package(s)</td>
                    <td className="px-2 py-3">
                      <span className={`inline-flex rounded-full border px-2.5 py-1 text-xs font-semibold ${stockBadge(product.stockPackages)}`}>
                        {stockLabel(product.stockPackages)}
                      </span>
                    </td>
                    <td className="px-2 py-3">
                      <Link
                        href="/admin/products"
                        className="rounded-full border border-border px-3 py-1 text-xs font-semibold hover:bg-surface-soft"
                      >
                        Update Stock
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </div>
  );
}
