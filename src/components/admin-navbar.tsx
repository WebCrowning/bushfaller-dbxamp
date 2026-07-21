"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { signOut } from "next-auth/react";
import { usePathname } from "next/navigation";
import {
  Bell,
  LayoutDashboard,
  Package,
  Boxes,
  ShoppingCart,
  BarChart3,
  Mail,
  ShieldCheck,
  MessageSquare,
  FileText,
  CircleHelp,
  Users,
  UserCog,
  Shield,
  Sparkles,
  type LucideIcon,
} from "lucide-react";

const adminNavItems = [
  { href: "/admin/notifications", label: "Notifications", icon: Bell },
  { href: "/admin", label: "Overview", icon: LayoutDashboard },
  { href: "/admin/products", label: "Products", icon: Package },
  { href: "/admin/inventory", label: "Inventory", icon: Boxes },
  { href: "/admin/orders", label: "Orders", icon: ShoppingCart },
  { href: "/admin/traffic", label: "Traffic Analytics", icon: BarChart3 },
  { href: "/admin/messages", label: "Messages", icon: Mail },
  { href: "/admin/messages/manage", label: "Message Retention", icon: ShieldCheck },
  { href: "/admin/chat", label: "Live Chat", icon: MessageSquare },
  { href: "/admin/content", label: "Page Content", icon: FileText },
  { href: "/admin/faq", label: "FAQ", icon: CircleHelp },
  { href: "/admin/users", label: "Users", icon: Users },
  { href: "/admin/sub-admins", label: "Sub-Admins", icon: UserCog },
];

type AdminNavItem = {
  href: string;
  label: string;
  icon: LucideIcon;
};

type AdminNavbarProps = {
  renderMobile?: boolean;
  renderDesktop?: boolean;
};

export function AdminNavbar({ renderMobile = true, renderDesktop = true }: AdminNavbarProps) {
  const pathname = usePathname();
  const [unreadCount, setUnreadCount] = useState(0);
  const navItems = adminNavItems as AdminNavItem[];
  const currentItem =
    navItems.find((item) => pathname === item.href)?.label ?? "Overview";

  useEffect(() => {
    let active = true;

    async function loadUnread() {
      try {
        const response = await fetch("/api/notifications", { cache: "no-store" });
        const payload = (await response.json().catch(() => null)) as { unreadCount?: number } | null;
        if (active && response.ok) {
          setUnreadCount(Number(payload?.unreadCount ?? 0));
        }
      } catch {
        if (active) {
          setUnreadCount(0);
        }
      }
    }

    void loadUnread();
    const timer = setInterval(() => {
      void loadUnread();
    }, 10000);

    return () => {
      active = false;
      clearInterval(timer);
    };
  }, []);

  const linkClass = (href: string) => {
    const isActive = pathname === href;

    return `block rounded-xl border px-3 py-2 text-sm font-semibold transition-all ${
      isActive
        ? "border-brand bg-brand text-white shadow-sm"
        : "border-transparent text-slate-200 hover:border-slate-600 hover:bg-slate-800"
    }`;
  };

  return (
    <>
      {renderMobile ? (
        <div className="mb-4 rounded-2xl border border-slate-700 bg-slate-900 p-3 text-white shadow-sm lg:hidden">
        <details className="group">
          <summary className="flex cursor-pointer list-none items-center justify-between rounded-xl border border-slate-700 bg-slate-800 px-3 py-2 text-sm font-bold text-white">
            <div>
              <p className="text-[0.65rem] uppercase tracking-[0.16em] text-slate-400">Admin Menu</p>
              <p className="text-sm font-bold text-white">{currentItem}</p>
            </div>
            <span className="text-xs font-semibold uppercase tracking-wide text-slate-300 transition-transform group-open:rotate-180">▼</span>
          </summary>

          <div className="mt-3 space-y-2">
            <nav className="grid gap-1">
              {navItems.map((item) => {
                const ItemIcon = item.icon;
                return (
                <Link key={item.href} href={item.href} className={linkClass(item.href)}>
                  <span className="flex items-center justify-between gap-2">
                    <span className="inline-flex items-center gap-2">
                      <ItemIcon size={14} />
                      <span>{item.label}</span>
                    </span>
                    {item.href === "/admin/notifications" && unreadCount > 0 ? (
                      <span className="rounded-full bg-red-600 px-2 py-0.5 text-[10px] font-bold text-white">
                        {unreadCount > 99 ? "99+" : unreadCount}
                      </span>
                    ) : null}
                  </span>
                </Link>
                );
              })}
            </nav>

            <div className="mt-2 grid grid-cols-2 gap-2">
              <Link
                href="/"
                className="rounded-xl border border-slate-700 px-3 py-2 text-center text-sm font-semibold text-slate-200 transition-colors hover:bg-slate-800"
              >
                Store Front
              </Link>
              <button
                type="button"
                onClick={() => signOut({ callbackUrl: "/" })}
                className="rounded-xl bg-brand px-3 py-2 text-sm font-semibold text-white transition-colors hover:bg-brand-deep"
              >
                Sign Out
              </button>
            </div>
          </div>
        </details>
        </div>
      ) : null}

      {renderDesktop ? (
        <aside className="hidden h-fit rounded-2xl border border-slate-700 bg-slate-900 p-4 text-white shadow-sm lg:sticky lg:top-6 lg:block">
        <div className="mb-4 rounded-xl border border-slate-700 bg-gradient-to-br from-slate-800 via-slate-900 to-slate-900 px-3 py-3">
          <p className="text-[0.65rem] font-bold uppercase tracking-[0.18em] text-slate-400">Account</p>
          <p className="mt-1 inline-flex items-center gap-2 text-sm font-extrabold text-white">
            <Shield size={14} className="text-brand" />
            Admin
          </p>
          <p className="inline-flex items-center gap-1.5 text-xs text-slate-400">
            <Sparkles size={12} className="text-slate-500" />
            Control center
          </p>
        </div>

        <nav className="space-y-1.5">
          {navItems.map((item) => {
            const ItemIcon = item.icon;
            return (
            <Link key={item.href} href={item.href} className={linkClass(item.href)}>
              <span className="flex items-center justify-between gap-2">
                <span className="inline-flex items-center gap-2">
                  <ItemIcon size={14} />
                  <span>{item.label}</span>
                </span>
                {item.href === "/admin/notifications" && unreadCount > 0 ? (
                  <span className="rounded-full bg-red-600 px-2 py-0.5 text-[10px] font-bold text-white">
                    {unreadCount > 99 ? "99+" : unreadCount}
                  </span>
                ) : null}
              </span>
            </Link>
            );
          })}
        </nav>

        <div className="mt-5 space-y-2 border-t border-slate-700 pt-4">
          <Link
            href="/"
            className="block rounded-xl border border-slate-700 px-3 py-2 text-center text-sm font-semibold text-slate-200 transition-colors hover:bg-slate-800"
          >
            Store Front
          </Link>
          <button
            type="button"
            onClick={() => signOut({ callbackUrl: "/" })}
            className="w-full rounded-xl bg-brand px-3 py-2 text-sm font-semibold text-white transition-colors hover:bg-brand-deep"
          >
            Sign Out
          </button>
        </div>
        </aside>
      ) : null}
    </>
  );
}
