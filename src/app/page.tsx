import { readdir } from "fs/promises";
import path from "path";
import Link from "next/link";
import type { Metadata } from "next";
import { FeaturedProductCard } from "@/components/featured-product-card";
import { HeroSlideshow } from "@/components/hero-slideshow";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";
import { query } from "@/lib/db";
import type { Product } from "@/types";

type FeaturedProduct = Pick<
  Product,
  "id" | "name" | "price" | "image" | "description" | "category"
>;

export const metadata: Metadata = {
  title: "Bushbuyer | Buy Authentic African Raw Food Online",
  description:
    "Shop premium African raw food ingredients - snails, dried fish, eru leaves - sourced directly from trusted farmers. Fast worldwide shipping.",
  keywords: "African food online, snails, dried fish, eru leaves, authentic African ingredients",
  openGraph: {
    title: "Bushbuyer | Premium African Raw Food Marketplace",
    description: "Shop authentic African raw food ingredients with worldwide delivery",
    url: "https://bushbuyer.com",
    type: "website",
    images: [
      {
        url: "/og-home.jpg",
        width: 1200,
        height: 630,
        alt: "Bushbuyer Homepage",
      },
    ],
  },
  alternates: {
    canonical: "https://bushbuyer.com",
  },
};

const highlights = [
  "Direct-from-source supplier network",
  "Cold-chain logistics for freshness",
  "Fast support via WhatsApp and email",
];

async function getUploadedImages() {
  const uploadDir = path.join(process.cwd(), "public", "uploads");

  try {
    const files = await readdir(uploadDir, { withFileTypes: true });
    return files
      .filter((entry) => entry.isFile())
      .map((entry) => entry.name)
      .filter((name) => /\.(png|jpg|jpeg|webp)$/i.test(name))
      .sort((a, b) => b.localeCompare(a))
      .map((name) => `/uploads/${name}`);
  } catch {
    return [] as string[];
  }
}

export const dynamic = "force-dynamic";

export default async function Home() {
  const [featuredProducts, uploadedImages] = await Promise.all([
    query<FeaturedProduct[]>(
      `SELECT id, name, price, image, description, category
       FROM products
       ORDER BY featured DESC, created_at DESC
       LIMIT 6`,
    ),
    getUploadedImages(),
  ]);

  const cards = featuredProducts.map((product, index) => {
    const swapImage = uploadedImages.find(
      (imagePath) => imagePath !== product.image && uploadedImages.indexOf(imagePath) % featuredProducts.length === index % Math.max(1, featuredProducts.length),
    ) ?? uploadedImages.find((imagePath) => imagePath !== product.image) ?? null;

    return {
      ...product,
      shortNote:
        product.description.length > 92
          ? `${product.description.slice(0, 89).trimEnd()}...`
          : product.description,
      swapImage,
    };
  });

  const categories = [
    { name: "Seafood", emoji: "🐟", color: "from-blue-500/20 to-cyan-500/20" },
    { name: "Protein", emoji: "🦪", color: "from-emerald-500/20 to-teal-500/20" },
    { name: "Vegetables", emoji: "🌿", color: "from-lime-500/20 to-emerald-500/20" },
  ];

  const testimonials = [
    {
      name: "Amara Okonkwo",
      role: "Restaurant Owner, Lagos",
      text: "Bushbuyer sources the most authentic ingredients. My customers notice the quality difference immediately.",
      rating: 5,
    },
    {
      name: "James Kofi",
      role: "Family Chef, Toronto",
      text: "Finally found genuine African products abroad. The freshness and taste are unmatched. Highly recommend!",
      rating: 5,
    },
    {
      name: "Yvette Mukondi",
      role: "Food Blogger, Paris",
      text: "Super impressed with the service and product variety. Bushbuyer makes diaspora cooking so much easier.",
      rating: 5,
    },
  ];

  const heroSlides = Array.from(
    new Set([
      ...uploadedImages.slice(0, 5),
      ...featuredProducts.map((product) => product.image).filter(Boolean),
    ]),
  ).slice(0, 6);

  return (
    <div className="min-h-screen">
      <SiteHeader />

      <main>
        <section className="relative overflow-hidden bg-gradient-to-br from-brand-deep/5 via-background to-accent/5 py-20 md:py-32">
          <div className="absolute inset-0 overflow-hidden pointer-events-none">
            <div className="absolute top-0 right-0 w-96 h-96 bg-brand/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/3" />
            <div className="absolute bottom-0 left-0 w-80 h-80 bg-accent/10 rounded-full blur-3xl translate-y-1/3 -translate-x-1/4" />
          </div>

          <div className="container-shell relative z-10">
            <div className="grid items-center gap-10 lg:grid-cols-[1.1fr_0.9fr] lg:gap-12">
              <div className="text-center lg:text-left">
                <p className="inline-flex items-center rounded-full border border-brand/20 bg-white/75 px-4 py-1.5 text-xs font-bold uppercase tracking-[0.14em] text-brand-deep mb-5">
                African Raw Food Marketplace
                </p>
                <h1 className="text-4xl md:text-6xl font-black leading-[1.05] tracking-tight text-brand-deep mb-5">
                  Authentic African ingredients,
                  <span className="block text-accent">delivered with global reliability.</span>
                </h1>
                <p className="mx-auto text-base md:text-lg leading-relaxed text-foreground/75 mb-8 max-w-2xl lg:mx-0">
                  Source premium snails, dried fish, and fresh eru leaves through verified farmers and processors. Every order is quality-checked, carefully packed, and shipped fast to your doorstep.
                </p>
              </div>

              <div className="mx-auto w-full max-w-xl lg:mx-0">
                <HeroSlideshow images={heroSlides} />
              </div>
            </div>

            <div className="mx-auto mt-12 max-w-4xl text-center">
              <div className="mb-8 flex flex-wrap justify-center gap-4">
                <Link
                  href="/products"
                  className="group relative px-8 py-3.5 bg-gradient-to-r from-brand to-brand-deep text-white font-bold rounded-full text-lg transition-all hover:shadow-lg hover:shadow-brand/30 active:scale-95"
                >
                  Explore Products
                </Link>
                <Link
                  href="/contact"
                  className="px-8 py-3.5 border-2 border-brand text-brand font-bold rounded-full text-lg transition-all hover:bg-brand/5"
                >
                  Get in Touch
                </Link>
              </div>

              <div className="grid grid-cols-1 gap-3 text-sm font-semibold text-foreground/80 sm:grid-cols-3 md:gap-6 md:text-base">
                <div className="flex items-center justify-center gap-2">
                  <span className="text-2xl">✓</span>
                  <span>100% Authentic</span>
                </div>
                <div className="flex items-center justify-center gap-2">
                  <span className="text-2xl">✓</span>
                  <span>Cold Chain Fresh</span>
                </div>
                <div className="flex items-center justify-center gap-2">
                  <span className="text-2xl">✓</span>
                  <span>Fast Shipping</span>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="py-16 md:py-24">
          <div className="container-shell">
            <div className="text-center mb-12">
              <p className="section-kicker">Shop by Category</p>
              <h2 className="section-title mt-2 text-brand-deep">Find Your Favorites</h2>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {categories.map((cat) => (
                <Link
                  key={cat.name}
                  href={`/products?category=${encodeURIComponent(cat.name)}`}
                  className={`group relative overflow-hidden rounded-2xl bg-gradient-to-br ${cat.color} border border-border p-8 transition-all hover:shadow-lg hover:scale-105`}
                >
                  <div className="relative z-10">
                    <div className="text-5xl mb-4">{cat.emoji}</div>
                    <h3 className="text-2xl font-bold text-foreground mb-2">{cat.name}</h3>
                    <p className="text-foreground/70 text-sm">Browse collection →</p>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>

        <section className="container-shell pb-14">
          <div className="mb-6 flex items-end justify-between gap-4">
            <div>
              <p className="section-kicker">Featured Products</p>
              <h2 className="section-title mt-2 text-brand-deep">Best Sellers & New Arrivals</h2>
            </div>
            <Link
              href="/products"
              className="inline-flex items-center gap-2 text-sm font-bold text-brand transition-colors hover:text-brand-deep"
            >
              View All →
            </Link>
          </div>
          <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
            {cards.map((product) => (
              <FeaturedProductCard key={product.id} {...product} />
            ))}
          </div>
        </section>

        <section className="py-16 md:py-24 bg-gradient-to-br from-slate-50 to-slate-100/50">
          <div className="container-shell">
            <div className="text-center mb-16">
              <p className="section-kicker">Trusted by Thousands</p>
              <h2 className="section-title mt-2 text-brand-deep">What Our Customers Say</h2>
            </div>
            <div className="grid md:grid-cols-3 gap-8">
              {testimonials.map((testimonial) => (
                <div key={testimonial.name} className="glass-card rounded-2xl p-8">
                  <div className="flex items-center gap-1 mb-4">
                    {Array.from({ length: testimonial.rating }).map((_, i) => (
                      <span key={i} className="text-lg">⭐</span>
                    ))}
                  </div>
                  <p className="text-foreground/80 leading-relaxed mb-6 italic">&quot;{testimonial.text}&quot;</p>
                  <div>
                    <p className="font-bold text-foreground">{testimonial.name}</p>
                    <p className="text-sm text-foreground/60">{testimonial.role}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="py-16 md:py-24">
          <div className="container-shell">
            <div className="grid md:grid-cols-2 gap-12 items-center">
              <div>
                <p className="section-kicker">Limited Time</p>
                <h2 className="text-4xl md:text-5xl font-black text-brand-deep mb-4 leading-tight">
                  Launch Week Special
                </h2>
                <p className="text-lg text-foreground/75 mb-6">
                  Celebrate with us! Get 15% off your first order plus free shipping on orders over $50.
                </p>
                <ul className="space-y-3 mb-8 text-foreground/80">
                  <li className="flex items-center gap-3">
                    <span className="text-accent text-xl">✓</span>
                    <span>Fresh, hand-picked ingredients</span>
                  </li>
                  <li className="flex items-center gap-3">
                    <span className="text-accent text-xl">✓</span>
                    <span>Packed within 24 hours of order</span>
                  </li>
                  <li className="flex items-center gap-3">
                    <span className="text-accent text-xl">✓</span>
                    <span>Satisfaction guaranteed</span>
                  </li>
                  <li className="flex items-center gap-3">
                    <span className="text-accent text-xl">✓</span>
                    <span>Bulk discounts available</span>
                  </li>
                </ul>
                <Link
                  href="/products"
                  className="inline-flex px-8 py-3.5 bg-gradient-to-r from-accent to-orange-600 text-white font-bold rounded-full text-lg transition-all hover:shadow-lg hover:shadow-accent/30"
                >
                  Claim Your Discount
                </Link>
              </div>
              <div className="relative">
                <div className="grid grid-cols-2 gap-3">
                  {uploadedImages.slice(0, 4).map((img, idx) => (
                    <div key={idx} className="aspect-square rounded-xl overflow-hidden shadow-lg hover:scale-105 transition-transform">
                      <img src={img} alt={`showcase-${idx}`} className="w-full h-full object-cover" />
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="py-16 md:py-24 bg-gradient-to-br from-brand-deep to-brand-deep/90 text-white relative overflow-hidden">
          <div className="absolute inset-0 opacity-10">
            <div className="absolute top-0 right-0 w-96 h-96 bg-accent rounded-full blur-3xl" />
          </div>
          <div className="container-shell relative z-10">
            <div className="max-w-3xl">
              <p className="inline-block px-4 py-2 bg-white/10 rounded-full text-sm font-bold mb-6">🏢 B2B & Wholesale</p>
              <h2 className="text-4xl md:text-5xl font-black mb-4 leading-tight">
                Supply Your Restaurant or Store
              </h2>
              <p className="text-lg text-white/80 mb-8 max-w-2xl">
                Premium wholesale pricing, dedicated support, and custom sourcing for restaurants, catering companies, and retailers worldwide.
              </p>
              <Link
                href="/contact"
                className="inline-flex px-8 py-3.5 bg-accent text-brand-deep font-bold rounded-full text-lg transition-all hover:bg-yellow-400 hover:shadow-lg"
              >
                Get Wholesale Pricing
              </Link>
            </div>
          </div>
        </section>
      </main>

      <SiteFooter />
    </div>
  );
}
