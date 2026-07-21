import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";
import { createAdminNotification } from "@/lib/notifications";

interface Conversation {
  id: number;
  customer_id: number;
  customer_name: string;
  customer_email: string;
  assigned_admin_id: number | null;
  admin_name?: string;
  status: string;
  last_message?: string;
  created_at: string;
  updated_at: string;
}

interface CreateConversationRequest {
  initialMessage?: string;
}

// Get or create conversation for logged-in customer
export async function GET() {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Get current user
    const currentUser = await query<Array<{ id: number; name: string }>>(
      "SELECT id, name FROM users WHERE email = ?",
      [session.user.email],
    );

    if (!currentUser.length) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }

    const userId = currentUser[0].id;

    // Get or create conversation
    let conversation = await query<Conversation[]>(
      `SELECT cc.id, cc.customer_id, u.name as customer_name, u.email as customer_email, 
              cc.assigned_admin_id, cc.status, cc.created_at, cc.updated_at
       FROM admin_chat_conversations cc
       JOIN users u ON cc.customer_id = u.id
       WHERE cc.customer_id = ? AND cc.status != 'closed'
       ORDER BY cc.updated_at DESC
       LIMIT 1`,
      [userId],
    );

    if (!conversation.length) {
      // Create new conversation
      const result = await query(
        "INSERT INTO admin_chat_conversations (customer_id, status) VALUES (?, 'open')",
        [userId],
      );
      
      const conversationId = result as { insertId: number };
      
      conversation = await query<Conversation[]>(
        `SELECT cc.id, cc.customer_id, u.name as customer_name, u.email as customer_email,
                cc.assigned_admin_id, cc.status, cc.created_at, cc.updated_at
         FROM admin_chat_conversations cc
         JOIN users u ON cc.customer_id = u.id
         WHERE cc.id = ?`,
        [conversationId.insertId],
      );

      await createAdminNotification({
        type: "chat",
        title: "New support chat opened",
        body: `${session.user.name ?? "A customer"} opened a support conversation.`,
        link: "/admin/chat",
      });
    }

    return NextResponse.json({ conversation: conversation[0] });
  } catch (err) {
    console.error("Error getting conversation:", err);
    return NextResponse.json(
      { error: "Failed to get conversation" },
      { status: 500 },
    );
  }
}

export async function POST(request: Request) {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = (await request.json().catch(() => null)) as CreateConversationRequest | null;

    // Get current user
    const currentUser = await query<Array<{ id: number }>>(
      "SELECT id FROM users WHERE email = ?",
      [session.user.email],
    );

    if (!currentUser.length) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const userId = currentUser[0].id;

    // Create a new conversation
    const result = await query(
      "INSERT INTO admin_chat_conversations (customer_id, status) VALUES (?, 'open')",
      [userId],
    );

    const conversationId = result as { insertId: number };

    // Send initial message if provided
    if (body?.initialMessage?.trim()) {
      await query(
        `INSERT INTO admin_chat_messages (conversation_id, sender_id, sender_type, message)
         VALUES (?, ?, 'customer', ?)`,
        [conversationId.insertId, userId, body.initialMessage],
      );
    }

    const conversation = await query<Conversation[]>(
      `SELECT cc.id, cc.customer_id, cc.assigned_admin_id, cc.status, cc.created_at, cc.updated_at
       FROM admin_chat_conversations cc
       WHERE cc.id = ?`,
      [conversationId.insertId],
    );

    await createAdminNotification({
      type: "chat",
      title: "New support chat opened",
      body: `${session.user.name ?? "A customer"} opened a support conversation.`,
      link: "/admin/chat",
    });

    return NextResponse.json({ conversation: conversation[0], created: true });
  } catch (err) {
    console.error("Error creating conversation:", err);
    return NextResponse.json(
      { error: "Failed to create conversation" },
      { status: 500 },
    );
  }
}
