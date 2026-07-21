"use client";

import { useState } from "react";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";

export function ContactPageClient() {
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const [status, setStatus] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  const trimmedEmail = email.trim();
  const isValidEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(trimmedEmail);

  async function submitMessage() {
    setStatus(null);
    setLoading(true);
    try {
      const response = await fetch("/api/messages", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email: trimmedEmail, message }),
      });

      if (!response.ok) {
        const payload = (await response.json().catch(() => ({}))) as {
          error?: unknown;
        };
        const errorText =
          typeof payload.error === "string"
            ? payload.error
            : "Failed to send message.";
        setStatus(errorText);
        return;
      }

      setMessage("");
      setStatus("Message sent. Our team will reply soon.");
    } catch {
      setStatus("Unexpected error while sending message.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="min-h-screen">
      <SiteHeader />
      <main className="container-shell py-10">
        <div className="glass-card mx-auto max-w-2xl rounded-3xl p-8">
          <p className="section-kicker">Messaging</p>
          <h1 className="mt-2 text-3xl font-bold text-brand-deep">Contact Admin</h1>
          <p className="mt-3 text-sm text-foreground/70">
            Send any questions about orders, shipping, wholesale, or product quality.
          </p>

          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="Your email address"
            className="mt-5 w-full rounded-2xl border border-border bg-surface px-4 py-3 text-sm"
            required
          />

          <textarea
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            placeholder="Type your message"
            className="mt-5 min-h-36 w-full rounded-2xl border border-border bg-surface px-4 py-3 text-sm"
          />

          <button
            type="button"
            disabled={loading || !isValidEmail || message.trim().length < 4}
            onClick={submitMessage}
            className="mt-4 rounded-full bg-brand px-6 py-2 text-sm font-semibold text-white disabled:cursor-not-allowed disabled:opacity-50"
          >
            {loading ? "Sending..." : "Send Message"}
          </button>

          {!isValidEmail && email.length > 0 ? (
            <p className="mt-2 text-xs text-red-600">Enter a valid email address to continue.</p>
          ) : null}

          {status ? <p className="mt-3 text-sm">{status}</p> : null}
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
