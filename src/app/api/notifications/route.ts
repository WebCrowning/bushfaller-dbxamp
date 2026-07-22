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

  const rawUserId = Number(session.user.id);
  const userId = !isNaN(rawUserId) && rawUserId > 0 ? rawUserId : 0;
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
      : userId > 0
      ? await query<NotificationRow[]>(
          `SELECT id, type, title, body, link, is_read, created_at
           FROM notifications
           WHERE audience = 'user' AND user_id = ?
           ORDER BY created_at DESC
           LIMIT 30`,
          [userId],
        )
      : [];

    const countRows = isAdmin
      ? await query<CountRow[]>(
          `SELECT COUNT(*) AS unread
           FROM notifications
           WHERE audience = 'admin' AND is_read = 0`,
        )
      : userId > 0
      ? await query<CountRow[]>(
          `SELECT COUNT(*) AS unread
           FROM notifications
           WHERE audience = 'user' AND user_id = ? AND is_read = 0`,
          [userId],
        )
      : [{ unread: 0 }];

    const countRow = countRows[0];

    return NextResponse.json({
      notifications: (notifications || []).map((row) => ({
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
  } catch (error) {
    console.error("Notifications API error:", error);
    return NextResponse.json({
      notifications: [],
      unreadCount: 0,
      role: isAdmin ? "admin" : "user",
    });
  }
}
