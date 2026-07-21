import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";

type ReadPayload = {
  notificationId?: number;
  markAll?: boolean;
  unmark?: boolean;
};

export async function PATCH(request: Request) {
  const session = await auth();
  if (!session?.user?.id) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const payload = (await request.json().catch(() => null)) as ReadPayload | null;
  const userId = Number(session.user.id);
  const role = (session.user as { role?: string } | undefined)?.role ?? "user";
  const isAdmin = role === "admin" || role === "sub_admin";

  try {
    if (payload?.markAll) {
      if (isAdmin) {
        await query(
          `UPDATE notifications
           SET is_read = 1, read_at = NOW()
           WHERE audience = 'admin' AND is_read = 0`,
        );
      } else {
        await query(
          `UPDATE notifications
           SET is_read = 1, read_at = NOW()
           WHERE audience = 'user' AND user_id = ? AND is_read = 0`,
          [userId],
        );
      }

      return NextResponse.json({ ok: true });
    }

    const notificationId = Number(payload?.notificationId ?? 0);
    if (!Number.isInteger(notificationId) || notificationId <= 0) {
      return NextResponse.json({ error: "Invalid notification id" }, { status: 400 });
    }

    if (payload?.unmark) {
      // Mark as unread
      if (isAdmin) {
        await query(
          `UPDATE notifications
           SET is_read = 0, read_at = NULL
           WHERE id = ? AND audience = 'admin'`,
          [notificationId],
        );
      } else {
        await query(
          `UPDATE notifications
           SET is_read = 0, read_at = NULL
           WHERE id = ? AND audience = 'user' AND user_id = ?`,
          [notificationId, userId],
        );
      }
    } else {
      // Mark as read
      if (isAdmin) {
        await query(
          `UPDATE notifications
           SET is_read = 1, read_at = NOW()
           WHERE id = ? AND audience = 'admin'`,
          [notificationId],
        );
      } else {
        await query(
          `UPDATE notifications
           SET is_read = 1, read_at = NOW()
           WHERE id = ? AND audience = 'user' AND user_id = ?`,
          [notificationId, userId],
        );
      }
    }

    return NextResponse.json({ ok: true });
  } catch {
    return NextResponse.json({ error: "Failed to update notifications" }, { status: 500 });
  }
}
