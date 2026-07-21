"use client";

import { useEffect, useState } from "react";
import type { ContactMessage } from "@/types";

export default function AdminMessagesPage() {
  const [messages, setMessages] = useState<ContactMessage[]>([]);
  const [replyMap, setReplyMap] = useState<Record<number, string>>({});
  const [status, setStatus] = useState("");

  async function loadMessages() {
    const response = await fetch("/api/admin/messages");
    const payload = (await response.json()) as { messages: ContactMessage[] };
    setMessages(payload.messages ?? []);
  }

  useEffect(() => {
    const timeout = setTimeout(() => {
      void loadMessages();
    }, 0);

    return () => clearTimeout(timeout);
  }, []);

  async function sendReply(id: number) {
    const reply = (replyMap[id] ?? "").trim();
    if (reply.length < 2) {
      setStatus("Reply must be at least 2 characters.");
      return;
    }

    const response = await fetch(`/api/admin/messages/${id}/reply`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ reply }),
    });

    if (response.ok) {
      setStatus(`Reply sent for message #${id}.`);
      await loadMessages();
    } else {
      setStatus(`Failed to reply to message #${id}.`);
    }
  }

  return (
    <div className="glass-card rounded-2xl p-5">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <h2 className="text-xl font-bold text-brand-deep">Customer Messages</h2>
        <a
          href="/admin/messages/manage"
          className="rounded-full border border-border bg-white px-4 py-2 text-xs font-semibold text-foreground transition-colors hover:bg-surface-soft"
        >
          Manage Retention
        </a>
      </div>
      {status ? <p className="mt-2 text-sm">{status}</p> : null}

      <div className="mt-4 space-y-3">
        {messages.map((message) => (
          <article key={message.id} className="rounded-xl border border-border bg-white p-4">
            <div className="flex items-center justify-between gap-3">
              <p className="text-sm font-semibold">Message #{message.id}</p>
              <span className="rounded-full bg-surface-soft px-2 py-1 text-xs font-semibold">{message.status}</span>
            </div>
            <p className="mt-1 text-xs text-foreground/60">From: {message.customer_email}</p>
            <p className="mt-2 text-sm text-foreground/80">{message.message}</p>

            {message.reply ? (
              <p className="mt-2 rounded-lg border border-emerald-200 bg-emerald-50 p-2 text-sm">
                Admin reply: {message.reply}
              </p>
            ) : null}

            <textarea
              className="mt-3 min-h-24 w-full rounded-xl border border-border px-3 py-2 text-sm"
              placeholder="Type reply"
              value={replyMap[message.id] ?? ""}
              onChange={(e) => setReplyMap((prev) => ({ ...prev, [message.id]: e.target.value }))}
            />
            <button
              type="button"
              onClick={() => void sendReply(message.id)}
              className="mt-2 rounded-full bg-brand px-4 py-2 text-xs font-semibold text-white"
            >
              Send Reply
            </button>
          </article>
        ))}
      </div>
    </div>
  );
}
