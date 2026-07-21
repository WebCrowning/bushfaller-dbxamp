import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import { createUserNotification } from "@/lib/notifications";
import { replySchema } from "@/lib/validation";
import { toId } from "@/lib/utils";
import { requireAdminApi } from "@/lib/authz";

type Params = {
  params: Promise<{ id: string }>;
};

export async function PATCH(request: Request, { params }: Params) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  const { id } = await params;
  const messageId = toId(id);

  if (!messageId) {
    return NextResponse.json({ error: "Invalid message id" }, { status: 400 });
  }

  const payload = await request.json().catch(() => null);
  const parsed = replySchema.safeParse(payload);

  if (!parsed.success) {
    return NextResponse.json({ error: parsed.error.flatten() }, { status: 400 });
  }

  try {
    const messageRows = await query<Array<{ user_id: number | null }>>(
      "SELECT user_id FROM messages WHERE id = ? LIMIT 1",
      [messageId],
    );

    if (!messageRows[0]) {
      return NextResponse.json({ error: "Message not found" }, { status: 404 });
    }

    await query("UPDATE messages SET reply = ?, status = 'Replied' WHERE id = ?", [
      parsed.data.reply,
      messageId,
    ]);

    if (messageRows[0].user_id) {
      await createUserNotification(Number(messageRows[0].user_id), {
        type: "contact",
        title: "Support replied to your message",
        body: "You have a new reply from support.",
        link: "/dashboard",
      });
    }

    return NextResponse.json({ ok: true });
  } catch {
    return NextResponse.json({ error: "Failed to send reply" }, { status: 500 });
  }
}
