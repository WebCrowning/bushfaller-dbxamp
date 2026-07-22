"use client";

import { useEffect, useState } from "react";
import { Trash2, Check, X, Archive } from "lucide-react";
import Link from "next/link";

export const dynamic = "force-dynamic";

type Notification = {
  id: number;
  type: string;
  title: string;
  body: string | null;
  link: string | null;
  isRead: boolean;
  createdAt: string;
};

type NotificationResponse = {
  notifications: Notification[];
  unreadCount: number;
};

const typeColors: Record<string, string> = {
  escalation: "bg-red-100 text-red-700 border-red-200",
  order: "bg-blue-100 text-blue-700 border-blue-200",
  message: "bg-purple-100 text-purple-700 border-purple-200",
  chat: "bg-indigo-100 text-indigo-700 border-indigo-200",
  ai_message: "bg-cyan-100 text-cyan-700 border-cyan-200",
  product: "bg-amber-100 text-amber-700 border-amber-200",
  system: "bg-slate-100 text-slate-700 border-slate-200",
  general: "bg-emerald-100 text-emerald-700 border-emerald-200",
};

function getNotificationActionLabel(notification: Notification): string {
  if (!notification.link) return "Open";

  if (notification.link.includes("/admin/chat")) return "Open Chat";
  if (notification.link.includes("/admin/orders")) return "Open Order";
  if (notification.link.includes("/admin/messages")) return "Open Message";

  return "Open";
}

export default function AdminNotificationsPage() {
  const [notifications, setNotifications] = useState<Notification[]>([]);
  const [selectedIds, setSelectedIds] = useState<Set<number>>(new Set());
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [interacting, setInteracting] = useState(false);
  const [filter, setFilter] = useState<"all" | "unread" | "read">("all");
  const [unreadCount, setUnreadCount] = useState(0);

  async function fetchNotifications(options?: { silent?: boolean }) {
    const silent = options?.silent ?? false;
    if (!silent) {
      setLoading(true);
    }
    try {
      const response = await fetch("/api/notifications", { cache: "no-store" });
      if (!response.ok) return;
      const data = (await response.json()) as NotificationResponse;
      setNotifications(data.notifications);
      setUnreadCount(data.unreadCount);
    } catch (error) {
      console.error("Failed to fetch notifications", error);
    } finally {
      if (!silent) {
        setLoading(false);
      }
    }
  }

  useEffect(() => {
    void fetchNotifications();
  }, []);

  useEffect(() => {
    const interval = setInterval(() => {
      // Avoid disrupting click/selection flow while user is interacting.
      if (document.visibilityState !== "visible" || interacting || submitting || selectedIds.size > 0) {
        return;
      }

      void fetchNotifications({ silent: true });
    }, 20000);

    return () => clearInterval(interval);
  }, [interacting, selectedIds.size, submitting]);

  const filtered = notifications.filter((n) => {
    if (filter === "unread") return !n.isRead;
    if (filter === "read") return n.isRead;
    return true;
  });

  const allSelected = filtered.length > 0 && filtered.every((n) => selectedIds.has(n.id));

  async function toggleRead(id: number, isRead: boolean) {
    if (isRead) {
      // Mark as unread (need new endpoint)
      await fetch("/api/notifications/read", {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ notificationId: id, unmark: true }),
      });
    } else {
      await fetch("/api/notifications/read", {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ notificationId: id }),
      });
    }
    await fetchNotifications();
  }

  async function deleteNotifications(ids: number[]) {
    setSubmitting(true);
    try {
      await fetch("/api/notifications/delete", {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ notificationIds: ids }),
      });
      setSelectedIds(new Set());
      await fetchNotifications();
    } finally {
      setSubmitting(false);
    }
  }

  async function markAllRead() {
    setSubmitting(true);
    try {
      await fetch("/api/notifications/read", {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ markAll: true }),
      });
      setSelectedIds(new Set());
      await fetchNotifications();
    } finally {
      setSubmitting(false);
    }
  }

  async function clearAll() {
    if (!confirm("Are you sure you want to clear all notifications? This cannot be undone.")) return;
    setSubmitting(true);
    try {
      await fetch("/api/notifications/delete", {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ clearAll: true }),
      });
      setSelectedIds(new Set());
      await fetchNotifications();
    } finally {
      setSubmitting(false);
    }
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-brand-deep mb-2">Admin Notifications</h1>
        <p className="text-foreground/70">Manage your notifications, messages, and alerts</p>
      </div>

      <div className="rounded-2xl border border-border bg-surface-soft p-4">
        <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
          <div className="flex flex-wrap items-center gap-2">
            <button
              onClick={() => setFilter("all")}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all ${
                filter === "all"
                  ? "bg-brand text-white"
                  : "border border-border bg-surface hover:bg-surface-soft"
              }`}
            >
              All ({notifications.length})
            </button>
            <button
              onClick={() => setFilter("unread")}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all ${
                filter === "unread"
                  ? "bg-brand text-white"
                  : "border border-border bg-surface hover:bg-surface-soft"
              }`}
            >
              Unread ({unreadCount})
            </button>
            <button
              onClick={() => setFilter("read")}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all ${
                filter === "read"
                  ? "bg-brand text-white"
                  : "border border-border bg-surface hover:bg-surface-soft"
              }`}
            >
              Read ({notifications.length - unreadCount})
            </button>
          </div>

          <div className="flex gap-2">
            {unreadCount > 0 && (
              <button
                onClick={() => void markAllRead()}
                disabled={submitting}
                className="inline-flex items-center gap-2 px-4 py-2 rounded-full text-sm font-semibold border border-brand text-brand hover:bg-brand/5 disabled:opacity-50"
              >
                <Check size={16} />
                Mark all read
              </button>
            )}
            {notifications.length > 0 && (
              <button
                onClick={() => void clearAll()}
                disabled={submitting}
                className="inline-flex items-center gap-2 px-4 py-2 rounded-full text-sm font-semibold border border-red-300 text-red-600 hover:bg-red-50 disabled:opacity-50"
              >
                <Trash2 size={16} />
                Clear all
              </button>
            )}
          </div>
        </div>
      </div>

      {loading ? (
        <div className="rounded-2xl border border-border bg-surface p-12 text-center text-foreground/70">
          Loading notifications...
        </div>
      ) : filtered.length === 0 ? (
        <div className="rounded-2xl border border-dashed border-border bg-surface p-12 text-center">
          <Archive size={40} className="mx-auto mb-3 text-foreground/30" />
          <p className="text-foreground/70">
            {filter === "unread" && "No unread notifications"}
            {filter === "read" && "No read notifications"}
            {filter === "all" && "No notifications yet"}
          </p>
        </div>
      ) : (
        <div
          className="space-y-3"
          onMouseEnter={() => setInteracting(true)}
          onMouseLeave={() => setInteracting(false)}
          onFocusCapture={() => setInteracting(true)}
          onBlurCapture={() => setInteracting(false)}
        >
          {filtered.map((notification) => {
            const isSelected = selectedIds.has(notification.id);
            const typeColor = typeColors[notification.type] || typeColors.general;
            const createdDate = new Date(notification.createdAt);
            const isRecent = Date.now() - createdDate.getTime() < 86400000; // 24 hours

            return (
              <div
                key={notification.id}
                className={`group rounded-xl border-2 p-4 transition-all ${
                  isSelected
                    ? "border-brand bg-brand/5"
                    : notification.isRead
                      ? "border-border bg-surface hover:border-brand/30"
                      : "border-brand/40 bg-brand/5 hover:border-brand/60"
                }`}
              >
                <div className="flex items-start gap-4">
                  <input
                    type="checkbox"
                    checked={isSelected}
                    onChange={(e) => {
                      const newSet = new Set(selectedIds);
                      if (e.target.checked) {
                        newSet.add(notification.id);
                      } else {
                        newSet.delete(notification.id);
                      }
                      setSelectedIds(newSet);
                    }}
                    className="mt-1.5"
                  />

                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-3 flex-wrap">
                      <span className={`inline-block px-2.5 py-1 rounded-full text-xs font-bold border ${typeColor}`}>
                        {notification.type.toUpperCase()}
                      </span>
                      {!notification.isRead && (
                        <span className="inline-block w-2 h-2 rounded-full bg-brand" />
                      )}
                      {isRecent && (
                        <span className="text-xs text-brand font-semibold">NEW</span>
                      )}
                    </div>

                    <h3 className="text-base font-bold text-foreground mt-2">{notification.title}</h3>

                    {notification.body && (
                      <p className="text-sm text-foreground/75 mt-1 line-clamp-2">
                        {notification.body}
                      </p>
                    )}

                    <div className="flex items-center gap-4 mt-3 text-xs text-foreground/60">
                      <span>{createdDate.toLocaleString()}</span>
                      {notification.link && (
                        <Link
                          href={notification.link}
                          className="text-brand font-semibold hover:text-brand-deep"
                        >
                          View
                        </Link>
                      )}
                    </div>
                  </div>

                    <div className="flex items-center gap-2">
                      {notification.link && (
                        <Link
                          href={notification.link}
                          className="inline-flex items-center rounded-full border border-brand/40 bg-brand/10 px-3 py-1.5 text-xs font-semibold text-brand hover:bg-brand/20"
                        >
                          {getNotificationActionLabel(notification)}
                        </Link>
                      )}
                    <button
                      onClick={() => void toggleRead(notification.id, notification.isRead)}
                      className="p-2 rounded-full hover:bg-surface border border-border transition-colors"
                      title={notification.isRead ? "Mark as unread" : "Mark as read"}
                    >
                      {notification.isRead ? (
                        <X size={18} className="text-amber-600" />
                      ) : (
                        <Check size={18} className="text-emerald-600" />
                      )}
                    </button>
                    <button
                      onClick={() => void deleteNotifications([notification.id])}
                      disabled={submitting}
                      className="p-2 rounded-full hover:bg-red-50 border border-border transition-colors disabled:opacity-50"
                      title="Delete"
                    >
                      <Trash2 size={18} className="text-red-600" />
                    </button>
                  </div>
                </div>
              </div>
            );
          })}

          {selectedIds.size > 0 && (
            <div className="sticky bottom-4 left-0 right-0 mx-auto max-w-4xl bg-white border border-border rounded-xl shadow-lg p-4 flex items-center justify-between">
              <p className="text-sm font-semibold text-foreground">
                {selectedIds.size} selected
              </p>
              <div className="flex gap-2">
                <button
                  onClick={() => void markAllRead()}
                  disabled={submitting}
                  className="inline-flex items-center gap-2 px-4 py-2 rounded-full text-sm font-semibold border border-brand text-brand hover:bg-brand/5 disabled:opacity-50"
                >
                  <Check size={16} />
                  Mark read
                </button>
                <button
                  onClick={() => void deleteNotifications(Array.from(selectedIds))}
                  disabled={submitting}
                  className="inline-flex items-center gap-2 px-4 py-2 rounded-full text-sm font-semibold border border-red-300 text-red-600 hover:bg-red-50 disabled:opacity-50"
                >
                  <Trash2 size={16} />
                  Delete
                </button>
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
