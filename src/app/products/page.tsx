import Image from "next/image";
import Link from "next/link";
import type { Metadata } from "next";
import { AddToCartButton } from "@/components/add-to-cart-button";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";
import { query } from "@/lib/db";
import { formatCurrency } from "@/lib/utils";
import type { Product } from "@/types";

export const metadata: Metadata = {
  title: "Products | Bushbuyer - Shop African Raw Food",
  description:
    "Browse our collection of authentic African raw food ingredients. Search by category, filter products, and order online with fast worldwide shipping.",
  keywords: "African food products, snails, dried fish, eru, food marketplace",
  openGraph: {
    title: "Products | Bushbuyer African Marketplace",
    description: "Browse authentic African raw food ingredients",
    type: "website",
  },
  alternates: {
    canonical: "https://bushbuyer.com/products",
  },
};

export const dynamic = "force-dynamic";

type Search = {
  q?: string;
  category?: string;
  page?: string;
};

type PageProps = {
  searchParams: Promise<Search>;
};

export default async function ProductsPage({ searchParams }: PageProps) {
  const { q = "", category = "All", page = "1" } = await searchParams;

  const pageSize = 9;
  const currentPage = Math.max(1, Number.parseInt(page, 10) || 1);
  const offset = (currentPage - 1) * pageSize;

  const [countRow] = await query<Array<{ total: number }>>(
    `SELECT COUNT(*) AS total
     FROM products
     WHERE (? = '' OR LOWER(name) LIKE CONCAT('%', LOWER(?), '%'))
       AND (? = 'All' OR category = ?)`,
    [q, q, category, category],
  );

  const totalProducts = Number(countRow?.total ?? 0);
  const totalPages = Math.max(1, Math.ceil(totalProducts / pageSize));

  const products = await query<Product[]>(
    `SELECT id, name, price, transport_fee AS transportFee, image, image_zoom AS imageZoom, description, featured, category, package_name AS packageName, unit_type AS unitType, unit_value AS unitValue, stock_packages AS stockPackages
     FROM products
     WHERE (? = '' OR LOWER(name) LIKE CONCAT('%', LOWER(?), '%'))
       AND (? = 'All' OR category = ?)
     ORDER BY created_at DESC
     LIMIT ? OFFSET ?`,
    [q, q, category, category, pageSize, offset],
  );

  const categories = await query<Array<{ category: string }>>(
    "SELECT DISTINCT category FROM products ORDER BY category ASC",
  );

  function pageHref(nextPage: number) {
    const params = new URLSearchParams();
    if (q) {
      params.set("q", q);
    }
    if (category && category !== "All") {
      params.set("category", category);
    }
    if (nextPage > 1) {
      params.set("page", String(nextPage));
    }
    const queryString = params.toString();
    return queryString ? `/products?${queryString}` : "/products";
  }

  const previousPage = Math.max(1, currentPage - 1);
  const nextPage = Math.min(totalPages, currentPage + 1);

  return (
    <div className="min-h-screen">
      <SiteHeader />

      <main className="container-shell py-10">
        <div className="mb-7 flex flex-wrap items-end justify-between gap-4">
          <div>
            <p className="section-kicker">Catalog</p>
            <h1 className="section-title mt-2 text-brand-deep">All Products</h1>
          </div>
          <Link href="/cart" className="rounded-full bg-brand px-5 py-2 text-sm font-semibold text-white">
            Go to Cart
          </Link>
        </div>

        <form className="glass-card mb-8 grid gap-3 rounded-2xl p-4 md:grid-cols-[1fr_220px_auto]">
          <input
            type="search"
            name="q"
            defaultValue={q}
            placeholder="Search products"
            className="rounded-xl border border-border bg-surface px-4 py-2 text-sm outline-none focus:border-brand"
          />
          <select
            name="category"
            defaultValue={category}
            className="rounded-xl border border-border bg-surface px-4 py-2 text-sm outline-none focus:border-brand"
          >
            <option value="All">All Categories</option>
            {categories.map((c) => (
              <option key={c.category} value={c.category}>
                {c.category}
              </option>
            ))}
          </select>
          <button className="rounded-xl bg-brand px-5 py-2 text-sm font-semibold text-white" type="submit">
            Apply
          </button>
        </form>

        <div className="mb-5 text-sm text-foreground/70">
          <p>
            Showing page {currentPage} of {totalPages} ({totalProducts} products)
          </p>
        </div>

        {products.length === 0 ? (
          <div className="glass-card rounded-2xl border border-brand/20 bg-brand/5 p-8 text-center">
            <p className="text-sm font-semibold uppercase tracking-wide text-brand/80">Product Not Available</p>
            <h2 className="mt-2 text-2xl font-bold text-brand-deep">Let us source it specially for you</h2>
            <p className="mx-auto mt-3 max-w-2xl text-sm text-foreground/70">
              We could not find this item right now. Send us a quick request and our team will help you get it fast.
            </p>
            <div className="mt-6 flex flex-wrap items-center justify-center gap-3">
              <Link href="/contact" className="rounded-full bg-brand px-5 py-2 text-sm font-semibold text-white">
                Request This Product
              </Link>
              <Link href="/chat" className="rounded-full border border-border px-5 py-2 text-sm font-semibold text-foreground/80 hover:bg-surface">
                Chat With Support
              </Link>
            </div>
          </div>
        ) : (
          <>
            <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
              {products.map((product) => (
                <article key={product.id} className="glass-card overflow-hidden rounded-2xl">
                  <div className="h-52 w-full overflow-hidden">
                    {(() => {
                      const zoom = Math.max(80, Math.min(180, Number(product.imageZoom ?? 100)));
                      const isZoomOut = zoom < 100;
                      return (
                        <Image
                          src={product.image}
                          alt={product.name}
                          width={640}
                          height={420}
                          className={`h-52 w-full ${isZoomOut ? "object-contain" : "object-cover"}`}
                          style={{
                            transform: `scale(${zoom / 100})`,
                            transformOrigin: "center center",
                            backgroundColor: isZoomOut ? "#f0efe8" : "transparent",
                          }}
                          unoptimized
                        />
                      );
                    })()}
                  </div>
                  <div className="space-y-3 p-5">
                    <p className="text-xs font-bold uppercase tracking-wide text-brand/80">{product.category}</p>
                    <h2 className="text-xl font-bold text-foreground">{product.name}</h2>
                    <p className="line-clamp-2 text-sm leading-6 text-foreground/70">{product.description}</p>
                    <p className="text-xs text-foreground/60">
                      ${Number(product.price).toFixed(2)} per {product.packageName} ({Number(product.unitValue)} {product.unitType})
                    </p>
                    <div className="flex items-center justify-between gap-3">
                      <span className="text-base font-bold text-brand-deep">{formatCurrency(Number(product.price), "USD")}</span>
                      <AddToCartButton product={product} />
                    </div>
                    <Link href={`/products/${product.id}`} className="inline-block text-sm font-semibold text-brand hover:text-brand-deep">
                      View details
                    </Link>
                  </div>
                </article>
              ))}
            </div>

            <div className="mt-8 flex items-center justify-center gap-2 md:justify-end">
              <Link
                href={pageHref(previousPage)}
                className={`rounded-full border px-5 py-2 text-sm font-semibold shadow-sm transition-colors ${currentPage <= 1
                    ? "pointer-events-none border-slate-200 bg-slate-100 text-slate-400"
                    : "border-slate-200 bg-white text-slate-700 hover:bg-slate-50"
                  }`}
              >
                Previous
              </Link>
              <span className="rounded-full border border-slate-200 bg-slate-50 px-3 py-1.5 text-xs font-semibold text-slate-600">
                {currentPage} / {totalPages}
              </span>
              <Link
                href={pageHref(nextPage)}
                className={`rounded-full border px-5 py-2 text-sm font-semibold shadow-sm transition-colors ${currentPage >= totalPages
                    ? "pointer-events-none border-slate-200 bg-slate-100 text-slate-400"
                    : "border-slate-200 bg-white text-slate-700 hover:bg-slate-50"
                  }`}
              >
                Next
              </Link>
            </div>
          </>
        )}
      </main>

      <SiteFooter />
    </div>
  );
}
