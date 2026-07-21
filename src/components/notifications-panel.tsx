"use client";

import Link from "next/link";
import { useEffect, useState } from "react";

type NotificationItem = {
  id: number;
  type: string;
  title: string;
  body: string | null;
  link: string | null;
  isRead: boolean;
  createdAt: string;
};

type NotificationResponse = {
  notifications: NotificationItem[];
  unreadCount: number;
};

export function NotificationsPanel({
  emptyText,
}: {
  emptyText: string;
}) {
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [data, setData] = useState<NotificationResponse>({ notifications: [], unreadCount: 0 });

  async function loadNotifications() {
    setLoading(true);
    try {
      const response = await fetch("/api/notifications", { cache: "no-store" });
      const payload = (await response.json().catch(() => null)) as NotificationResponse | null;
      if (!response.ok || !payload) {
        setData({ notifications: [], unreadCount: 0 });
        return;
      }
      setData(payload);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    void loadNotifications();
  }, []);

  async function markAllRead() {
    setSubmitting(true);
    try {
      await fetch("/api/notifications/read", {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ markAll: true }),
      });
      await loadNotifications();
    } finally {
      setSubmitting(false);
    }
  }

  async function markRead(id: number) {
    await fetch("/api/notifications/read", {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ notificationId: id }),
    });
    await loadNotifications();
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <p className="text-sm text-foreground/70">
          Unread notifications: <span className="font-semibold text-brand-deep">{data.unreadCount}</span>
        </p>
        <button
          type="button"
          onClick={() => void markAllRead()}
          disabled={submitting || data.unreadCount === 0}
          className="rounded-full border border-border px-4 py-1.5 text-xs font-semibold disabled:opacity-50"
        >
          {submitting ? "Updating..." : "Mark all as read"}
        </button>
      </div>

      {loading ? (
        <p className="text-sm text-foreground/70">Loading notifications...</p>
      ) : data.notifications.length === 0 ? (
        <div className="rounded-xl border border-dashed border-border bg-surface p-6 text-sm text-foreground/70">
          {emptyText}
        </div>
      ) : (
        <div className="space-y-3">
          {data.notifications.map((item) => (
            <article
              key={item.id}
              className={`rounded-xl border p-4 ${item.isRead ? "border-border bg-surface" : "border-brand/40 bg-brand/5"}`}
            >
              <div className="flex items-start justify-between gap-3">
                <div>
                  <p className="text-sm font-bold text-brand-deep">{item.title}</p>
                  {item.body ? <p className="mt-1 text-sm text-foreground/75">{item.body}</p> : null}
                  <p className="mt-2 text-xs text-foreground/55">{new Date(item.createdAt).toLocaleString()}</p>
                </div>
                {!item.isRead ? (
                  <button
                    type="button"
                    onClick={() => void markRead(item.id)}
                    className="rounded-full border border-border px-3 py-1 text-xs font-semibold"
                  >
                    Mark read
                  </button>
                ) : null}
              </div>

              {item.link ? (
                <Link href={item.link} className="mt-3 inline-block text-xs font-semibold text-brand hover:text-brand-deep">
                  Open
                </Link>
              ) : null}
            </article>
          ))}
        </div>
      )}
    </div>
  );
}
