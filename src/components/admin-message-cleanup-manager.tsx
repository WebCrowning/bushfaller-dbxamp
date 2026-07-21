"use client";

import { useState } from "react";

type CleanupScope = "contact" | "live-chat" | "ai-chat" | "all";
type CleanupUnit = "months" | "years";

type PreviewPayload = {
  dryRun: boolean;
  cutoffDate: string;
  counts: {
    contact: number;
    liveChat: number;
    aiChat: number;
  };
  total: number;
};

export function AdminMessageCleanupManager() {
  const [scope, setScope] = useState<CleanupScope>("all");
  const [unit, setUnit] = useState<CleanupUnit>("months");
  const [value, setValue] = useState(6);
  const [preview, setPreview] = useState<PreviewPayload | null>(null);
  const [loadingPreview, setLoadingPreview] = useState(false);
  const [deleting, setDeleting] = useState(false);
  const [message, setMessage] = useState("");

  async function runPreview() {
    setLoadingPreview(true);
    setMessage("");
    try {
      const response = await fetch("/api/admin/messages/cleanup", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ scope, unit, value, dryRun: true }),
      });

      const payload = (await response.json().catch(() => null)) as PreviewPayload | { error?: string } | null;

      if (!response.ok || !payload || "error" in payload) {
        setMessage((payload as { error?: string } | null)?.error || "Preview failed.");
        return;
      }

      setPreview(payload as PreviewPayload);
    } catch {
      setMessage("Preview failed.");
    } finally {
      setLoadingPreview(false);
    }
  }

  async function runDelete() {
    if (!preview) {
      setMessage("Run preview before deleting.");
      return;
    }

    const ok = confirm("Delete old messages now? This cannot be undone.");
    if (!ok) return;

    setDeleting(true);
    setMessage("");

    try {
      const response = await fetch("/api/admin/messages/cleanup", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ scope, unit, value, dryRun: false }),
      });

      const payload = (await response.json().catch(() => null)) as
        | { ok?: boolean; totalDeleted?: number; error?: string }
        | null;

      if (!response.ok || !payload?.ok) {
        setMessage(payload?.error || "Delete failed.");
        return;
      }

      setMessage(`Cleanup complete. Deleted ${payload.totalDeleted ?? 0} old messages.`);
      setPreview(null);
    } catch {
      setMessage("Delete failed.");
    } finally {
      setDeleting(false);
    }
  }

  return (
    <div className="space-y-5 rounded-2xl border border-border bg-white p-5 md:p-6">
      <div>
        <h1 className="text-2xl font-bold text-brand-deep">Message Retention Manager</h1>
        <p className="mt-1 text-sm text-foreground/65">Delete old messages by months or years.</p>
      </div>

      <div className="grid gap-4 md:grid-cols-3">
        <label className="text-sm font-semibold text-foreground/80">
          Scope
          <select
            value={scope}
            onChange={(e) => setScope(e.target.value as CleanupScope)}
            className="mt-1 w-full rounded-xl border border-border bg-surface px-3 py-2 text-sm"
          >
            <option value="all">All Messages</option>
            <option value="contact">Contact Messages</option>
            <option value="live-chat">Live Chat Messages</option>
            <option value="ai-chat">AI Chat Messages</option>
          </select>
        </label>

        <label className="text-sm font-semibold text-foreground/80">
          Retention Unit
          <select
            value={unit}
            onChange={(e) => setUnit(e.target.value as CleanupUnit)}
            className="mt-1 w-full rounded-xl border border-border bg-surface px-3 py-2 text-sm"
          >
            <option value="months">Months</option>
            <option value="years">Years</option>
          </select>
        </label>

        <label className="text-sm font-semibold text-foreground/80">
          Older Than
          <input
            type="number"
            min={1}
            max={20}
            value={value}
            onChange={(e) => setValue(Number(e.target.value || 1))}
            className="mt-1 w-full rounded-xl border border-border bg-surface px-3 py-2 text-sm"
          />
        </label>
      </div>

      <div className="flex flex-wrap gap-3">
        <button
          type="button"
          onClick={() => void runPreview()}
          disabled={loadingPreview || deleting}
          className="rounded-full border border-brand px-5 py-2 text-sm font-semibold text-brand transition-colors hover:bg-brand/5 disabled:opacity-60"
        >
          {loadingPreview ? "Checking..." : "Preview Delete"}
        </button>

        <button
          type="button"
          onClick={() => void runDelete()}
          disabled={deleting || loadingPreview || !preview}
          className="rounded-full bg-red-600 px-5 py-2 text-sm font-semibold text-white transition-colors hover:bg-red-700 disabled:opacity-60"
        >
          {deleting ? "Deleting..." : "Delete Old Messages"}
        </button>
      </div>

      {preview ? (
        <div className="rounded-xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-900">
          <p className="font-semibold">Preview Result</p>
          <p className="mt-1">Cutoff date: {new Date(preview.cutoffDate).toLocaleDateString()}</p>
          <ul className="mt-2 space-y-1">
            <li>Contact messages: {preview.counts.contact}</li>
            <li>Live chat messages: {preview.counts.liveChat}</li>
            <li>AI chat messages: {preview.counts.aiChat}</li>
            <li className="font-bold">Total to delete: {preview.total}</li>
          </ul>
        </div>
      ) : null}

      {message ? (
        <p className={`text-sm font-semibold ${message.includes("complete") ? "text-emerald-600" : "text-red-600"}`}>
          {message}
        </p>
      ) : null}
    </div>
  );
}
