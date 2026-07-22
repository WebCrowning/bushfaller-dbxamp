import type { Metadata } from "next";
import { SiteHeader } from "@/components/site-header";
import { SiteFooter } from "@/components/site-footer";
import { query } from "@/lib/db";

export const metadata: Metadata = {
  title: "FAQ | Bushbuyer",
  description: "Find answers to common questions about African food products, shipping, and ordering.",
  alternates: {
    canonical: "https://bushbuyer.com/faq",
  },
};

type PublicFaq = {
  id: number;
  question: string;
  answer: string;
  category: string;
  updated_at: string;
};

function normalizeCategory(value: string | null | undefined) {
  const trimmed = String(value ?? "").trim();
  return trimmed.length > 0 ? trimmed : "General";
}

export default async function FAQPage() {
  const faqs = await query<PublicFaq[]>(
    `SELECT id, question, answer, category, updated_at
     FROM faq
     ORDER BY category ASC, updated_at DESC`,
  );

  const grouped = faqs.reduce<Record<string, PublicFaq[]>>((acc, item) => {
    const category = normalizeCategory(item.category);
    if (!acc[category]) {
      acc[category] = [];
    }
    acc[category].push({
      ...item,
      category,
    });
    return acc;
  }, {});

  const categories = Object.keys(grouped).sort((a, b) => a.localeCompare(b));
  const totalFaqs = faqs.length;

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-50 via-white to-slate-50">
      <SiteHeader />

      <main className="container-shell py-10">
        <section className="rounded-3xl border border-slate-200 bg-white p-8 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Help Center</p>
          <h1 className="mt-2 text-4xl font-black tracking-tight text-slate-900">Frequently Asked Questions</h1>
          <p className="mt-3 max-w-3xl text-sm leading-6 text-slate-600">
            Find fast answers about products, shipping, payments, and support. This page is updated directly from the admin FAQ manager.
          </p>
          <div className="mt-5 flex flex-wrap gap-3 text-xs font-semibold">
            <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-700">{totalFaqs} Q&amp;A entries</span>
            <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-700">{categories.length} categories</span>
          </div>
        </section>

        {totalFaqs === 0 ? (
          <section className="mt-6 rounded-2xl border border-dashed border-slate-300 bg-white p-10 text-center">
            <h2 className="text-lg font-bold text-slate-800">No FAQs Published Yet</h2>
            <p className="mt-2 text-sm text-slate-600">
              The support team has not published FAQs yet. Please check back soon.
            </p>
          </section>
        ) : (
          <section className="mt-6 space-y-6">
            {categories.map((category) => (
              <article key={category} className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
                <div className="mb-4 flex items-center justify-between gap-3">
                  <h2 className="text-xl font-bold text-slate-900">{category}</h2>
                  <span className="rounded-full bg-emerald-50 px-3 py-1 text-xs font-semibold text-emerald-700">
                    {grouped[category].length} item{grouped[category].length > 1 ? "s" : ""}
                  </span>
                </div>

                <div className="space-y-3">
                  {grouped[category].map((item) => (
                    <details
                      key={item.id}
                      className="group rounded-xl border border-slate-200 bg-slate-50 p-4 open:bg-white open:shadow-sm"
                    >
                      <summary className="cursor-pointer list-none pr-6 text-sm font-semibold text-slate-800 marker:hidden">
                        {item.question}
                      </summary>
                      <p className="mt-3 whitespace-pre-wrap text-sm leading-6 text-slate-700">{item.answer}</p>
                      <p className="mt-2 text-xs text-slate-500">
                        Updated {new Date(item.updated_at).toLocaleDateString()}
                      </p>
                    </details>
                  ))}
                </div>
              </article>
            ))}
          </section>
        )}
      </main>

      <SiteFooter />
    </div>
  );
}
