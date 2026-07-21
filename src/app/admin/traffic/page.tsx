"use client";

import { useEffect, useState } from "react";
import { ChevronDown } from "lucide-react";

type Summary = {
  totalPageViews: number;
  uniqueVisitors: number;
  avgLoadMs: number | null;
};

type Daily = {
  day: string;
  pageViews: number;
  uniqueVisitors: number;
  topCountry: string | null;
};

type TopPage = {
  path: string;
  pageViews: number;
  uniqueVisitors: number;
  avgLoadMs: number | null;
  topCountry: string | null;
};

type Referrer = {
  referrer: string | null;
  count: number;
};

type CountryData = {
  country: string | null;
  pageViews: number;
  uniqueVisitors: number;
};

export default function AdminTrafficPage() {
  const [days, setDays] = useState<number | null>(30);
  const [country, setCountry] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [summary, setSummary] = useState<Summary>({ totalPageViews: 0, uniqueVisitors: 0, avgLoadMs: null });
  const [daily, setDaily] = useState<Daily[]>([]);
  const [topPages, setTopPages] = useState<TopPage[]>([]);
  const [referrers, setReferrers] = useState<Referrer[]>([]);
  const [countries, setCountries] = useState<CountryData[]>([]);

  useEffect(() => {
    async function loadTraffic() {
      setLoading(true);
      try {
        const daysParam = days === null ? "all" : days;
        const countryParam = country ? `&country=${encodeURIComponent(country)}` : "";
        const response = await fetch(`/api/admin/traffic?days=${daysParam}${countryParam}`, { cache: "no-store" });
        const payload = (await response.json().catch(() => null)) as
          | {
              summary?: Summary;
              daily?: Daily[];
              topPages?: TopPage[];
              referrers?: Referrer[];
              countries?: CountryData[];
            }
          | null;

        if (!response.ok || !payload) {
          setSummary({ totalPageViews: 0, uniqueVisitors: 0, avgLoadMs: null });
          setDaily([]);
          setTopPages([]);
          setReferrers([]);
          setCountries([]);
          return;
        }

        setSummary(payload.summary ?? { totalPageViews: 0, uniqueVisitors: 0, avgLoadMs: null });
        setDaily(payload.daily ?? []);
        setTopPages(payload.topPages ?? []);
        setReferrers(payload.referrers ?? []);
        setCountries(payload.countries ?? []);
      } finally {
        setLoading(false);
      }
    }

    void loadTraffic();
  }, [days, country]);

  return (
    <div className="space-y-6">
      <section className="rounded-2xl border border-border bg-white p-5 shadow-sm">
        <div className="mb-4">
          <h1 className="text-2xl font-bold text-brand-deep">Traffic Analytics</h1>
          <p className="text-sm text-foreground/65">Visitor rundown and page performance.</p>
        </div>
        
        <div className="flex flex-wrap items-center gap-4">
          <div className="flex gap-2">
            {[7, 30, 90].map((value) => (
              <button
                key={value}
                type="button"
                onClick={() => setDays(value)}
                className={`rounded-full border px-4 py-1.5 text-xs font-semibold transition-colors ${
                  days === value ? "border-brand bg-brand text-white" : "border-border bg-white hover:bg-surface-soft"
                }`}
              >
                {value} days
              </button>
            ))}
            <button
              type="button"
              onClick={() => setDays(null)}
              className={`rounded-full border px-4 py-1.5 text-xs font-semibold transition-colors ${
                days === null ? "border-brand bg-brand text-white" : "border-border bg-white hover:bg-surface-soft"
              }`}
            >
              All Time
            </button>
          </div>

          <div className="relative">
            <select
              value={country ?? ""}
              onChange={(e) => setCountry(e.target.value || null)}
              className="appearance-none rounded-full border border-border bg-white px-4 py-1.5 pr-8 text-xs font-semibold text-foreground transition-colors hover:bg-surface-soft"
            >
              <option value="">All Countries</option>
              {countries
                .filter((c) => c.country)
                .map((c) => (
                  <option key={c.country} value={c.country || ""}>
                    {c.country} ({c.pageViews.toLocaleString()} views)
                  </option>
                ))}
            </select>
            <ChevronDown className="pointer-events-none absolute right-2 top-1/2 h-4 w-4 -translate-y-1/2 text-foreground/60" />
          </div>

          {country && (
            <div className="flex items-center gap-2 rounded-full bg-blue-50 px-3 py-1.5 text-xs">
              <span className="font-semibold text-blue-900">Filtering: {country}</span>
              <button
                onClick={() => setCountry(null)}
                className="ml-1 text-blue-600 hover:text-blue-900"
              >
                ✕
              </button>
            </div>
          )}
        </div>
      </section>

      <section className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
        <article className="rounded-2xl border border-border bg-white p-5 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">Page Views</p>
          <p className="mt-2 text-3xl font-extrabold text-brand-deep">{loading ? "..." : summary.totalPageViews}</p>
        </article>
        <article className="rounded-2xl border border-border bg-white p-5 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">Unique Visitors</p>
          <p className="mt-2 text-3xl font-extrabold text-brand-deep">{loading ? "..." : summary.uniqueVisitors}</p>
        </article>
        <article className="rounded-2xl border border-border bg-white p-5 shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-wide text-foreground/60">Avg Load Time</p>
          <p className="mt-2 text-3xl font-extrabold text-brand-deep">
            {loading ? "..." : summary.avgLoadMs !== null ? `${summary.avgLoadMs} ms` : "N/A"}
          </p>
        </article>
      </section>

      <section className="grid gap-5 lg:grid-cols-[1.2fr_0.8fr]">
        <div className="rounded-2xl border border-border bg-white p-5 shadow-sm">
          <h2 className="text-lg font-bold text-brand-deep">Top Pages</h2>
          <div className="mt-4 overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-border text-left text-foreground/60">
                  <th className="py-2 pr-3">Path</th>
                  <th className="py-2 pr-3">Views</th>
                  <th className="py-2 pr-3">Visitors</th>
                  <th className="py-2 pr-3">Top Country</th>
                  <th className="py-2">Avg Load</th>
                </tr>
              </thead>
              <tbody>
                {topPages.map((row) => (
                  <tr key={row.path} className="border-b border-border/40">
                    <td className="py-2 pr-3 font-semibold text-foreground/80">{row.path}</td>
                    <td className="py-2 pr-3">{row.pageViews}</td>
                    <td className="py-2 pr-3">{row.uniqueVisitors}</td>
                    <td className="py-2 pr-3">
                      {row.topCountry ? (
                        <span className="inline-block rounded-full bg-blue-50 px-2.5 py-0.5 text-xs font-semibold text-blue-700">
                          {row.topCountry}
                        </span>
                      ) : (
                        <span className="text-foreground/40">-</span>
                      )}
                    </td>
                    <td className="py-2">{row.avgLoadMs !== null ? `${row.avgLoadMs} ms` : "-"}</td>
                  </tr>
                ))}
              </tbody>
            </table>
            {!loading && topPages.length === 0 ? <p className="mt-3 text-sm text-foreground/60">No traffic data yet.</p> : null}
          </div>
        </div>

        <div className="rounded-2xl border border-border bg-white p-5 shadow-sm">
          <h2 className="text-lg font-bold text-brand-deep">Traffic by Day</h2>
          <div className="mt-4 space-y-2">
            {daily.slice(-10).map((row) => (
              <div key={row.day} className="rounded-xl border border-border bg-surface/60 px-3 py-2 text-sm">
                <div className="flex items-center justify-between">
                  <div>
                    <span className="font-semibold text-foreground/80">{new Date(row.day).toLocaleDateString()}</span>
                    {row.topCountry && (
                      <span className="ml-2 inline-block rounded-full bg-green-50 px-2 py-0.5 text-xs font-medium text-green-700">
                        📍 {row.topCountry}
                      </span>
                    )}
                  </div>
                  <span className="text-foreground/70">{row.pageViews} views</span>
                </div>
                <p className="mt-1 text-xs text-foreground/60">{row.uniqueVisitors} unique visitors</p>
              </div>
            ))}
            {!loading && daily.length === 0 ? <p className="text-sm text-foreground/60">No daily traffic yet.</p> : null}
          </div>

          <h3 className="mt-6 text-sm font-bold uppercase tracking-wide text-foreground/70">Top Referrers</h3>
          <div className="mt-2 space-y-2">
            {referrers.map((ref) => (
              <div key={`${ref.referrer}-${ref.count}`} className="rounded-lg border border-border bg-surface/50 px-3 py-2 text-xs">
                <p className="font-semibold text-foreground/80 truncate">{ref.referrer || "Direct"}</p>
                <p className="text-foreground/60">{ref.count} visits</p>
              </div>
            ))}
            {!loading && referrers.length === 0 ? <p className="text-xs text-foreground/60">No referrer data yet.</p> : null}
          </div>
        </div>
      </section>

      {!loading && countries.length > 0 && (
        <section className="rounded-2xl border border-border bg-white p-5 shadow-sm">
          <h2 className="text-lg font-bold text-brand-deep">Visitors by Country</h2>
          <div className="mt-4 overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-border text-left text-foreground/60">
                  <th className="py-2 pr-3">Country</th>
                  <th className="py-2 pr-3">Page Views</th>
                  <th className="py-2">Unique Visitors</th>
                </tr>
              </thead>
              <tbody>
                {countries
                  .filter((c) => c.country)
                  .slice(0, 20)
                  .map((c) => (
                    <tr key={c.country} className="border-b border-border/40 hover:bg-surface/40 cursor-pointer">
                      <td className="py-3 pr-3 font-semibold text-foreground/80">
                        <button
                          onClick={() => setCountry(c.country)}
                          className="hover:text-brand transition-colors"
                        >
                          {c.country}
                        </button>
                      </td>
                      <td className="py-3 pr-3">{c.pageViews.toLocaleString()}</td>
                      <td className="py-3">{c.uniqueVisitors.toLocaleString()}</td>
                    </tr>
                  ))}
              </tbody>
            </table>
            {countries.filter((c) => c.country).length === 0 ? (
              <p className="mt-3 text-sm text-foreground/60">No country data available yet.</p>
            ) : null}
          </div>
        </section>
      )}
    </div>
  );
}
