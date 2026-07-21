import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";

type DeletePayload = {
  notificationIds?: number[];
  clearAll?: boolean;
};

export async function DELETE(request: Request) {
  const session = await auth();
  if (!session?.user?.id) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const payload = (await request.json().catch(() => null)) as DeletePayload | null;
  const userId = Number(session.user.id);
  const role = (session.user as { role?: string } | undefined)?.role ?? "user";
  const isAdmin = role === "admin" || role === "sub_admin";

  try {
    if (payload?.clearAll) {
      if (isAdmin) {
        await query(`DELETE FROM notifications WHERE audience = 'admin'`);
      } else {
        await query(
          `DELETE FROM notifications WHERE audience = 'user' AND user_id = ?`,
          [userId],
        );
      }
      return NextResponse.json({ ok: true });
    }

    const notificationIds = (payload?.notificationIds ?? []).filter(
      (id) => Number.isInteger(id) && id > 0,
    );

    if (notificationIds.length === 0) {
      return NextResponse.json({ error: "No valid notification IDs" }, { status: 400 });
    }

    if (isAdmin) {
      const placeholders = notificationIds.map(() => "?").join(",");
      await query(
        `DELETE FROM notifications WHERE id IN (${placeholders}) AND audience = 'admin'`,
        notificationIds,
      );
    } else {
      const placeholders = notificationIds.map(() => "?").join(",");
      await query(
        `DELETE FROM notifications WHERE id IN (${placeholders}) AND audience = 'user' AND user_id = ?`,
        [...notificationIds, userId],
      );
    }

    return NextResponse.json({ ok: true });
  } catch {
    return NextResponse.json({ error: "Failed to delete notifications" }, { status: 500 });
  }
}
