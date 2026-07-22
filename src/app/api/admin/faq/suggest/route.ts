import { NextResponse } from "next/server";
import { requireAdminApi } from "@/lib/authz";
import { env, getRequiredEnv } from "@/lib/env";
import { query } from "@/lib/db";

interface SuggestRequest {
  answer?: string;
  source?: "answer" | "messages";
}

type CustomerMessage = {
  message: string;
  reply: string | null;
  created_at: string;
}

const suggestionSystemPrompt = `You are an expert at generating FAQ content for Bushbuyer and African food products.

You will be given either:
1) A direct answer text, or
2) A list of recent customer messages (and optional admin replies).

Generate practical FAQ suggestions that are useful for customers.

Format your response as JSON array with exactly 5 objects:
[
  {
    "question": "Question 1?",
    "answer": "Clear, concise answer based on available context.",
    "category": "Shipping"
  }
]

Requirements:
- Natural and customer-focused
- Specific to Bushbuyer or African food products
- Varied in scope (product, shipping, payment, support, etc.)
- Clear and concise`;

export async function POST(request: Request) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  const payload = (await request.json().catch(() => null)) as SuggestRequest | null;
  const source = payload?.source ?? "answer";

  if (source === "answer" && !payload?.answer?.trim()) {
    return NextResponse.json({ error: "Answer is required" }, { status: 400 });
  }

  try {
    const apiKey = getRequiredEnv("OPENROUTER_API_KEY", env.openrouterApiKey);

    let userContent = "";

    if (source === "messages") {
      const messages = await query<CustomerMessage[]>(
        `SELECT message, reply, created_at
         FROM messages
         WHERE message IS NOT NULL AND TRIM(message) != ''
         ORDER BY created_at DESC
         LIMIT 30`,
      );

      if (messages.length === 0) {
        return NextResponse.json(
          { error: "No customer messages available yet" },
          { status: 400 },
        );
      }

      userContent = `Generate FAQ suggestions from these recent customer messages:\n\n${messages
        .map((m, idx) => {
          const replyPart = m.reply ? `\nAdmin reply: ${m.reply}` : "";
          return `${idx + 1}. Customer message: ${m.message}${replyPart}`;
        })
        .join("\n\n")}`;
    } else {
      userContent = `Generate FAQ suggestions for this answer:\n\n${payload?.answer ?? ""}`;
    }

    const response = await fetch("https://openrouter.ai/api/v1/chat/completions", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${apiKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        model: "openai/gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content: suggestionSystemPrompt,
          },
          {
            role: "user",
            content: userContent,
          },
        ],
        temperature: 0.8,
        max_tokens: 900,
      }),
    });

    if (!response.ok) {
      const error = await response.json().catch(() => ({}));
      console.error("OpenRouter API error:", error);
      return NextResponse.json(
        { error: "Failed to generate suggestions" },
        { status: response.status },
      );
    }

    const data = (await response.json()) as {
      choices?: Array<{ message?: { content?: string } }>;
    };

    const content = data.choices?.[0]?.message?.content || "[]";

    const parsed = JSON.parse(content) as Array<{
      question?: string;
      answer?: string;
      category?: string;
    }>;

    const suggestions = (Array.isArray(parsed) ? parsed : [])
      .filter((item) => Boolean(item?.question))
      .slice(0, 5)
      .map((item) => ({
        question: String(item.question ?? "").trim(),
        answer: String(item.answer ?? "").trim(),
        category: String(item.category ?? "General").trim() || "General",
      }));

    if (suggestions.length === 0) {
      return NextResponse.json(
        { error: "No suggestions generated" },
        { status: 500 },
      );
    }

    return NextResponse.json({ suggestions });
  } catch (err) {
    console.error("Suggestion error:", err);
    return NextResponse.json(
      { error: "Failed to generate question suggestions" },
      { status: 500 },
    );
  }
}
