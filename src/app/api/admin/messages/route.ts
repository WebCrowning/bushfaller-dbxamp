import { NextResponse } from "next/server";
import { query } from "@/lib/db";
import { requireAdminApi } from "@/lib/authz";
import type { ContactMessage } from "@/types";

export async function GET() {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  try {
    const messages = await query<ContactMessage[]>(
      "SELECT id, user_id, customer_email, message, reply, status, created_at FROM messages ORDER BY created_at DESC",
    );
    return NextResponse.json({ messages });
  } catch {
    return NextResponse.json({ error: "Failed to fetch messages" }, { status: 500 });
  }
}
