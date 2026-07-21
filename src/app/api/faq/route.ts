import { NextResponse } from "next/server";
import { query } from "@/lib/db";

type PublicFaq = {
  id: number;
  question: string;
  answer: string;
  category: string;
  updated_at: string;
};

export async function GET() {
  try {
    const faqs = await query<PublicFaq[]>(
      `SELECT id, question, answer, category, updated_at
       FROM faq
       ORDER BY category ASC, updated_at DESC`,
    );

    return NextResponse.json({ faqs: faqs ?? [] });
  } catch (error) {
    console.error("Failed to fetch public FAQ:", error);
    return NextResponse.json({ error: "Failed to fetch FAQ" }, { status: 500 });
  }
}
