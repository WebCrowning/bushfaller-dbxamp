import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";

type NotificationRow = {
  id: number;
  type: string;
  title: string;
  body: string | null;
  link: string | null;
  is_read: number;
  created_at: string;
};

type CountRow = {
  unread: number;
};

export async function GET() {
  const session = await auth();
  if (!session?.user?.id) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const userId = Number(session.user.id);
  const role = (session.user as { role?: string } | undefined)?.role ?? "user";
  const isAdmin = role === "admin" || role === "sub_admin";

  try {
    const notifications = isAdmin
      ? await query<NotificationRow[]>(
          `SELECT id, type, title, body, link, is_read, created_at
           FROM notifications
           WHERE audience = 'admin'
           ORDER BY created_at DESC
           LIMIT 30`,
        )
      : await query<NotificationRow[]>(
          `SELECT id, type, title, body, link, is_read, created_at
           FROM notifications
           WHERE audience = 'user' AND user_id = ?
           ORDER BY created_at DESC
           LIMIT 30`,
          [userId],
        );

    const [countRow] = isAdmin
      ? await query<CountRow[]>(
          `SELECT COUNT(*) AS unread
           FROM notifications
           WHERE audience = 'admin' AND is_read = 0`,
        )
      : await query<CountRow[]>(
          `SELECT COUNT(*) AS unread
           FROM notifications
           WHERE audience = 'user' AND user_id = ? AND is_read = 0`,
          [userId],
        );

    return NextResponse.json({
      notifications: notifications.map((row) => ({
        id: row.id,
        type: row.type,
        title: row.title,
        body: row.body,
        link: row.link,
        isRead: Number(row.is_read) === 1,
        createdAt: row.created_at,
      })),
      unreadCount: Number(countRow?.unread ?? 0),
      role: isAdmin ? "admin" : "user",
    });
  } catch {
    return NextResponse.json({ error: "Failed to fetch notifications" }, { status: 500 });
  }
}
