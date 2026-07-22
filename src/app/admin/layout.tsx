import type { Metadata } from "next";
import Link from "next/link";
import { requireAdminPage } from "@/lib/authz";
import { AdminNavbar } from "@/components/admin-navbar";
import { Bell } from "lucide-react";

export const metadata: Metadata = {
  robots: "noindex, nofollow",
};

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  await requireAdminPage();

  return (
    <div className="min-h-screen bg-surface-soft">
      <div className="container-shell py-6 md:py-8">
        <AdminNavbar renderDesktop={false} />

        <div className="mb-6 rounded-2xl border border-border bg-white/90 p-4 shadow-sm md:p-5">
          <div className="flex flex-wrap items-center justify-between gap-3">
            <div>
              <p className="section-kicker">Admin</p>
              <h1 className="text-2xl font-bold text-brand-deep md:text-3xl">Bushbuyer Dashboard</h1>
              <p className="mt-1 text-sm text-foreground/65">Manage operations, orders, and customer support from one workspace.</p>
            </div>
            <Link href="/" className="rounded-full border border-border bg-white px-4 py-2 text-sm font-semibold transition-colors hover:bg-surface-soft">
              Back to Store
            </Link>
            <Link href="/admin/inventory" className="rounded-full border border-border bg-white px-4 py-2 text-sm font-semibold transition-colors hover:bg-surface-soft">
              Inventory Monitor
            </Link>
            <Link
              href="/admin/notifications"
              className="inline-flex items-center gap-2 rounded-full border border-border bg-white px-4 py-2 text-sm font-semibold transition-colors hover:bg-surface-soft"
            >
              <Bell size={16} />
              Notifications
            </Link>
          </div>
        </div>

        <div className="grid gap-5 lg:grid-cols-[250px_1fr] lg:items-start">
          <AdminNavbar renderMobile={false} />
          <section className="rounded-2xl border border-border bg-white/85 p-3 shadow-sm md:p-4">{children}</section>
        </div>
      </div>
    </div>
  );
}
