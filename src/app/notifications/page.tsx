"use client";

import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import { useEffect } from "react";
import { SiteHeader } from "@/components/site-header";
import { SiteFooter } from "@/components/site-footer";
import { NotificationsPanel } from "@/components/notifications-panel";
import { Bell } from "lucide-react";

export default function NotificationsPage() {
  const { data: session, status } = useSession();
  const router = useRouter();

  useEffect(() => {
    if (status === "unauthenticated") {
      router.push("/signin?callbackUrl=/notifications");
    }
  }, [status, router]);

  if (status === "loading") {
    return (
      <div className="min-h-screen flex flex-col justify-between">
        <SiteHeader />
        <main className="container-shell flex items-center justify-center py-24">
          <div className="text-center text-foreground/70">Loading notifications...</div>
        </main>
        <SiteFooter />
      </div>
    );
  }

  if (!session) {
    return null;
  }

  return (
    <div className="min-h-screen flex flex-col justify-between">
      <SiteHeader />
      <main className="container-shell py-12">
        <div className="glass-card mx-auto max-w-4xl rounded-3xl p-8">
          <header className="flex items-center gap-3 border-b border-border pb-6 mb-6">
            <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-brand/10 text-brand">
              <Bell size={20} />
            </div>
            <div>
              <h1 className="text-2xl font-bold text-brand-deep">My Notifications</h1>
              <p className="text-sm text-foreground/60">
                Track your order updates, support messages, and system alerts.
              </p>
            </div>
          </header>
          <NotificationsPanel emptyText="You have no notifications yet." />
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
