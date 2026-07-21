import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";
import { generateSupportAiReply } from "@/lib/ai-support";
import { createAdminNotification, createUserNotification } from "@/lib/notifications";

interface ChatMessage {
  id: string;
  sender_id: number | null;
  sender_type: "customer" | "admin" | "bot";
  sender_name: string;
  message: string;
  created_at: string;
}

// Get messages for a conversation
export async function GET(
  _req: Request,
  { params }: { params: Promise<{ conversationId: string }> },
) {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const { conversationId } = await params;

    // Get current user
    const currentUser = await query<Array<{ id: number; role: string }>>(
      "SELECT id, role FROM users WHERE email = ?",
      [session.user.email],
    );

    if (!currentUser.length) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const userId = currentUser[0].id;
    const userRole = currentUser[0].role;

    // Check access: customer owns it or admin assigned to it
    const conversation = await query<Array<{ customer_id: number; assigned_admin_id: number | null }>>(
      "SELECT customer_id, assigned_admin_id FROM admin_chat_conversations WHERE id = ?",
      [conversationId],
    );

    if (!conversation.length) {
      return NextResponse.json({ error: "Conversation not found" }, { status: 404 });
    }

    const isCustomer = conversation[0].customer_id === userId;
    const isAssignedAdmin = conversation[0].assigned_admin_id === userId;
    const isAdminRole = userRole === "admin" || userRole === "sub_admin";

    if (!isCustomer && !isAssignedAdmin && !isAdminRole) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
    }

    // Get messages
    const messages = await query<ChatMessage[]>(
      `SELECT CONCAT('user-', acm.id) as id,
              acm.sender_id,
              acm.sender_type,
              u.name as sender_name,
              acm.message,
              acm.created_at
       FROM admin_chat_messages acm
       JOIN users u ON acm.sender_id = u.id
       WHERE acm.conversation_id = ?
       UNION ALL
       SELECT CONCAT('bot-', aiam.id) as id,
              NULL as sender_id,
              'bot' as sender_type,
              'AI Assistant' as sender_name,
              aiam.message,
              aiam.created_at
       FROM admin_chat_ai_messages aiam
       WHERE aiam.conversation_id = ?
       ORDER BY created_at ASC`,
      [conversationId, conversationId],
    );

    return NextResponse.json({ messages });
  } catch (err) {
    console.error("Error getting messages:", err);
    return NextResponse.json(
      { error: "Failed to get messages" },
      { status: 500 },
    );
  }
}

// Send a message
export async function POST(
  request: Request,
  { params }: { params: Promise<{ conversationId: string }> },
) {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const { conversationId } = await params;
    const body = await request.json().catch(() => null);

    if (!body?.message?.trim()) {
      return NextResponse.json(
        { error: "Message is required" },
        { status: 400 },
      );
    }

    // Get current user
    const currentUser = await query<Array<{ id: number; role: string }>>(
      "SELECT id, role FROM users WHERE email = ?",
      [session.user.email],
    );

    if (!currentUser.length) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const userId = currentUser[0].id;
    const userRole = currentUser[0].role;

    // Check access
    const conversation = await query<Array<{ customer_id: number; assigned_admin_id: number | null; status: string }>>(
      "SELECT customer_id, assigned_admin_id, status FROM admin_chat_conversations WHERE id = ?",
      [conversationId],
    );

    if (!conversation.length) {
      return NextResponse.json({ error: "Conversation not found" }, { status: 404 });
    }

    if (conversation[0].status === "closed") {
      return NextResponse.json(
        { error: "Cannot message a closed conversation" },
        { status: 400 },
      );
    }

    const isCustomer = conversation[0].customer_id === userId;
    const isAssignedAdmin = conversation[0].assigned_admin_id === userId;
    const isAdminRole = userRole === "admin" || userRole === "sub_admin";

    if (!isCustomer && !isAssignedAdmin && !isAdminRole) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
    }

    const senderType = isCustomer ? "customer" : "admin";

    let historyForAi: Array<{ role: "user" | "assistant"; content: string }> = [];

    if (isCustomer) {
      const historyRows = await query<Array<{ sender_type: string; message: string; created_at: string }>>(
        `SELECT sender_type, message, created_at
         FROM (
           SELECT sender_type, message, created_at
           FROM admin_chat_messages
           WHERE conversation_id = ?
           UNION ALL
           SELECT 'bot' as sender_type, message, created_at
           FROM admin_chat_ai_messages
           WHERE conversation_id = ?
         ) t
         ORDER BY created_at DESC
         LIMIT 12`,
        [conversationId, conversationId],
      );

      historyForAi = historyRows
        .reverse()
        .map((row) => ({
          role: row.sender_type === "customer" ? "user" : "assistant",
          content: row.message,
        }));
    }

    // Insert message
    await query(
      `INSERT INTO admin_chat_messages (conversation_id, sender_id, sender_type, message)
       VALUES (?, ?, ?, ?)`,
      [conversationId, userId, senderType, body.message],
    );

    // Update conversation updated_at
    await query(
      "UPDATE admin_chat_conversations SET updated_at = NOW() WHERE id = ?",
      [conversationId],
    );

    if (isCustomer) {
      await createAdminNotification({
        type: "chat",
        title: "New customer chat message",
        body: "A customer sent a new message in support chat.",
        link: `/admin/chat?conversationId=${conversationId}`,
      });
    } else {
      await createUserNotification(conversation[0].customer_id, {
        type: "chat",
        title: "Support replied in your chat",
        body: "You have a new response from an admin.",
        link: "/chat",
      });
    }

    let aiReply: string | null = null;
    let aiSuppressed = false;
    let adminEscalated = false;

    if (isCustomer) {
      const aiTagPattern = /(^|\s)@(ai|bot|chatbot|assistant|helper|supportbot|support|chat)\b/i;
      const aiIntentPattern = /(ask\s+(the\s+)?(ai|bot|chatbot|assistant)|ai\s+help|assistant\s+help|chatbot\s+help|bot\s+help|need\s+ai|use\s+ai|use\s+chatbot|ai\s+please)/i;
      const adminTagPattern = /(^|\s)@(admin|agent|human)\b/i;
      const adminIntentPattern = /(talk\s+with\s+admin|talk\s+to\s+admin|speak\s+to\s+admin|i\s+want\s+to\s+talk\s+with\s+admin|human\s+agent|live\s+agent|real\s+person|customer\s+support\s+agent)/i;
      const customerRequestedAi = aiTagPattern.test(body.message) || aiIntentPattern.test(body.message);
      const customerRequestedAdmin =
        adminTagPattern.test(body.message) || adminIntentPattern.test(body.message);

      if (customerRequestedAdmin) {
        adminEscalated = true;

        const adminAck = conversation[0].assigned_admin_id
          ? "Your request has been shared with the admin handling this chat. They will reply shortly."
          : "Thank you. Your request has been forwarded to our admin team. Please hold on while an agent joins this chat.";

        await query(
          `INSERT INTO admin_chat_ai_messages (conversation_id, message)
           VALUES (?, ?)`,
          [conversationId, adminAck],
        );

        await query(
          "UPDATE admin_chat_conversations SET updated_at = NOW() WHERE id = ?",
          [conversationId],
        );

        await createAdminNotification({
          type: "escalation",
          title: "Customer requested admin support",
          body: `Customer asked for admin attention in conversation #${conversationId}.`,
          link: `/admin/chat?conversationId=${conversationId}`,
        });

        return NextResponse.json({
          message: "Message sent",
          aiReply: adminAck,
          aiSuppressed: false,
          adminEscalated,
        });
      }

      const adminMessageCountRows = await query<Array<{ count: number }>>(
        "SELECT COUNT(*) AS count FROM admin_chat_messages WHERE conversation_id = ? AND sender_type = 'admin'",
        [conversationId],
      );

      const adminHasReplied = Number(adminMessageCountRows[0]?.count ?? 0) > 0;
      const adminAlreadyHandling = Boolean(conversation[0].assigned_admin_id);

      if ((adminHasReplied || adminAlreadyHandling) && !customerRequestedAi) {
        aiSuppressed = true;
        return NextResponse.json({
          message: "Message sent",
          aiReply: null,
          aiSuppressed,
          adminEscalated,
        });
      }

      const aiInputMessage = body.message
        .replace(/(^|\s)@(ai|bot|chatbot|assistant|helper|supportbot|support|chat)\b/gi, " ")
        .replace(/(^|\s)@(admin|agent|human)\b/gi, " ")
        .replace(/\s+/g, " ")
        .trim();

      try {
        aiReply = await generateSupportAiReply(
          aiInputMessage || body.message,
          historyForAi,
        );

        await query(
          `INSERT INTO admin_chat_ai_messages (conversation_id, message)
           VALUES (?, ?)`,
          [conversationId, aiReply],
        );

        await query(
          "UPDATE admin_chat_conversations SET updated_at = NOW() WHERE id = ?",
          [conversationId],
        );

        // Check if AI message calls for admin attention
        const hasAdminMention = aiReply.toLowerCase().includes("@admin");
        
        if (hasAdminMention) {
          // Escalation notification for admin mention
          await createAdminNotification({
            type: "escalation",
            title: "🚨 AI needs your attention - @admin called",
            body: `The AI Assistant escalated a customer issue: "${aiReply.substring(0, 120)}${aiReply.length > 120 ? "..." : ""}"`,
            link: `/admin/chat?conversationId=${conversationId}`,
          });
        } else {
          // Regular AI response notification
          await createAdminNotification({
            type: "ai_message",
            title: "AI responded to customer",
            body: `AI Assistant replied: "${aiReply.substring(0, 100)}${aiReply.length > 100 ? "..." : ""}"`,
            link: `/admin/chat?conversationId=${conversationId}`,
          });
        }
      } catch (aiError) {
        console.error("AI reply generation/storage failed:", aiError);

        const fallbackReply = "I could not generate an AI response right now. Our admin team has been notified and will assist you shortly.";

        await query(
          `INSERT INTO admin_chat_ai_messages (conversation_id, message)
           VALUES (?, ?)`,
          [conversationId, fallbackReply],
        );

        await query(
          "UPDATE admin_chat_conversations SET updated_at = NOW() WHERE id = ?",
          [conversationId],
        );

        await createAdminNotification({
          type: "escalation",
          title: "AI fallback triggered in support chat",
          body: `AI could not respond in conversation #${conversationId}. Admin follow-up needed.`,
          link: `/admin/chat?conversationId=${conversationId}`,
        });

        aiReply = fallbackReply;
      }
    }

    return NextResponse.json({ message: "Message sent", aiReply, aiSuppressed, adminEscalated });
  } catch (err) {
    console.error("Error sending message:", err);
    return NextResponse.json(
      { error: "Failed to send message" },
      { status: 500 },
    );
  }
}
