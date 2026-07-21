import { NextResponse } from "next/server";
import { requireAdminApi } from "@/lib/authz";
import { query } from "@/lib/db";

type CleanupScope = "contact" | "live-chat" | "ai-chat" | "all";
type CleanupUnit = "months" | "years";

type CleanupRequest = {
  scope?: CleanupScope;
  unit?: CleanupUnit;
  value?: number;
  dryRun?: boolean;
};

type CountRow = { count: number };
type DbResult = { affectedRows: number };

function buildCutoffDate(unit: CleanupUnit, value: number) {
  const now = new Date();
  const cutoff = new Date(now);

  if (unit === "months") {
    cutoff.setMonth(cutoff.getMonth() - value);
  } else {
    cutoff.setFullYear(cutoff.getFullYear() - value);
  }

  return cutoff;
}

function isValidScope(scope: string): scope is CleanupScope {
  return ["contact", "live-chat", "ai-chat", "all"].includes(scope);
}

function isValidUnit(unit: string): unit is CleanupUnit {
  return ["months", "years"].includes(unit);
}

export async function POST(request: Request) {
  const access = await requireAdminApi();
  if ("error" in access) {
    return NextResponse.json({ error: access.error }, { status: access.status });
  }

  const payload = (await request.json().catch(() => null)) as CleanupRequest | null;
  const scope = String(payload?.scope ?? "");
  const unit = String(payload?.unit ?? "");
  const value = Number(payload?.value ?? 0);
  const dryRun = Boolean(payload?.dryRun);

  if (!isValidScope(scope) || !isValidUnit(unit) || !Number.isInteger(value) || value < 1 || value > 20) {
    return NextResponse.json(
      { error: "Invalid request. Use scope, unit (months|years), and value (1-20)." },
      { status: 400 },
    );
  }

  const cutoffDate = buildCutoffDate(unit, value);

  try {
    const counts = {
      contact: 0,
      liveChat: 0,
      aiChat: 0,
    };

    if (scope === "contact" || scope === "all") {
      const rows = await query<CountRow[]>(
        "SELECT COUNT(*) AS count FROM messages WHERE created_at < ?",
        [cutoffDate],
      );
      counts.contact = Number(rows[0]?.count ?? 0);
    }

    if (scope === "live-chat" || scope === "all") {
      const rows = await query<CountRow[]>(
        "SELECT COUNT(*) AS count FROM admin_chat_messages WHERE created_at < ?",
        [cutoffDate],
      );
      counts.liveChat = Number(rows[0]?.count ?? 0);
    }

    if (scope === "ai-chat" || scope === "all") {
      const rows = await query<CountRow[]>(
        "SELECT COUNT(*) AS count FROM admin_chat_ai_messages WHERE created_at < ?",
        [cutoffDate],
      );
      counts.aiChat = Number(rows[0]?.count ?? 0);
    }

    if (dryRun) {
      return NextResponse.json({
        dryRun: true,
        cutoffDate,
        counts,
        total: counts.contact + counts.liveChat + counts.aiChat,
      });
    }

    const deleted = {
      contact: 0,
      liveChat: 0,
      aiChat: 0,
    };

    if (scope === "contact" || scope === "all") {
      const result = await query<DbResult>(
        "DELETE FROM messages WHERE created_at < ?",
        [cutoffDate],
      );
      deleted.contact = Number((result as unknown as DbResult).affectedRows ?? 0);
    }

    if (scope === "live-chat" || scope === "all") {
      const result = await query<DbResult>(
        "DELETE FROM admin_chat_messages WHERE created_at < ?",
        [cutoffDate],
      );
      deleted.liveChat = Number((result as unknown as DbResult).affectedRows ?? 0);
    }

    if (scope === "ai-chat" || scope === "all") {
      const result = await query<DbResult>(
        "DELETE FROM admin_chat_ai_messages WHERE created_at < ?",
        [cutoffDate],
      );
      deleted.aiChat = Number((result as unknown as DbResult).affectedRows ?? 0);
    }

    return NextResponse.json({
      ok: true,
      cutoffDate,
      deleted,
      totalDeleted: deleted.contact + deleted.liveChat + deleted.aiChat,
    });
  } catch {
    return NextResponse.json({ error: "Failed to cleanup old messages" }, { status: 500 });
  }
}
