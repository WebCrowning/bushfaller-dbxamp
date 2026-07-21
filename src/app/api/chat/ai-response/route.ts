import { NextRequest, NextResponse } from "next/server";
import { generateSupportAiReply } from "@/lib/ai-support";

interface ChatMessage {
  role: "user" | "assistant";
  content: string;
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json() as { message: string; history?: ChatMessage[] };
    
    if (!body.message?.trim()) {
      return NextResponse.json(
        { error: "Message is required" },
        { status: 400 }
      );
    }

    const reply = await generateSupportAiReply(body.message, body.history || []);

    return NextResponse.json({ reply, source: "ai-chatbot" });
  } catch (error) {
    console.error("AI response error:", error);
    return NextResponse.json(
      { error: "Failed to process message" },
      { status: 500 }
    );
  }
}
