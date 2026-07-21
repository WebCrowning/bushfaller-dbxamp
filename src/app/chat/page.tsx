"use client";

import { useEffect, useMemo, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { SiteHeader } from "@/components/site-header";
import { SiteFooter } from "@/components/site-footer";
import { Send, Loader, Sparkles, MessageSquareText } from "lucide-react";

interface Message {
  id: string;
  sender_id: number | null;
  sender_type: string;
  sender_name: string;
  message: string;
  created_at: string;
}

interface Conversation {
  id: number;
  status: string;
}

const quickPrompts = [
  "I need help tracking my order",
  "I want to check payment status",
  "I need to update delivery details",
  "How can I request a refund?",
];

export default function ChatPage() {
  const router = useRouter();
  const messagesEndRef = useRef<HTMLDivElement | null>(null);
  const [conversation, setConversation] = useState<Conversation | null>(null);
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(true);
  const [sending, setSending] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [adminOnline, setAdminOnline] = useState(false);
  const [botThinking, setBotThinking] = useState(false);

  useEffect(() => {
    fetchConversation();
    checkAdminStatus();
  }, []);

  useEffect(() => {
    if (conversation?.id) {
      const interval = setInterval(() => {
        fetchMessages();
        checkAdminStatus();
      }, 2000); // Poll every 2 seconds

      return () => clearInterval(interval);
    }
  }, [conversation?.id]);

  async function fetchConversation() {
    try {
      const res = await fetch("/api/admin-chat/conversations");
      if (res.status === 401) {
        router.push("/signin?callbackUrl=/chat");
        return;
      }

      if (!res.ok) throw new Error("Failed to fetch conversation");
      const data = (await res.json()) as { conversation: Conversation };
      setConversation(data.conversation);
      await fetchMessages(data.conversation.id);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load chat");
    } finally {
      setLoading(false);
    }
  }

  async function fetchMessages(convId?: number) {
    try {
      const id = convId || conversation?.id;
      if (!id) return;

      const res = await fetch(`/api/admin-chat/conversations/${id}/messages`);
      if (!res.ok) throw new Error("Failed to fetch messages");
      const data = (await res.json()) as { messages: Message[] };
      setMessages(data.messages);
    } catch (err) {
      console.error("Error fetching messages:", err);
    }
  }

  async function checkAdminStatus() {
    try {
      const res = await fetch("/api/admin-chat/admin-status");
      if (!res.ok) return;
      const data = (await res.json()) as { admins: Array<{ status: string }> };
      const hasOnlineAdmin = data.admins?.some((a) => a.status === "online");
      setAdminOnline(!!hasOnlineAdmin);
    } catch (err) {
      console.error("Error checking admin status:", err);
    }
  }

  async function handleSend() {
    if (!input.trim() || !conversation?.id) return;

    const messageText = input.trim();
    setError(null);
    setSuccess(null);
    setSending(true);
    try {
      const res = await fetch(`/api/admin-chat/conversations/${conversation.id}/messages`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: messageText }),
      });

      if (!res.ok) throw new Error("Failed to send message");

      const payload = (await res.json().catch(() => null)) as
        | { aiReply?: string | null; aiSuppressed?: boolean; adminEscalated?: boolean }
        | null;

      setInput("");
      await fetchMessages();

      const aiSuppressed = Boolean(payload?.aiSuppressed);
      const hasAiReply = Boolean(payload?.aiReply);
      const adminEscalated = Boolean(payload?.adminEscalated);

      // AI response is generated and persisted server-side when enabled.
      setBotThinking(hasAiReply);

      if (adminEscalated) {
        setSuccess("Admin attention requested. An agent will respond shortly.");
      } else if (aiSuppressed) {
        setSuccess("Message sent successfully. Admin is handling this conversation.");
      } else if (hasAiReply) {
        setSuccess(adminOnline ? "Message sent successfully." : "Message sent. AI Assistant has provided a response.");
      } else {
        setSuccess("Message sent successfully.");
      }

      await fetchMessages();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to send message");
    } finally {
      setBotThinking(false);
      setSending(false);
    }
  }

  async function startNewChat() {
    setSending(true);
    try {
      const res = await fetch("/api/admin-chat/conversations", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({}),
      });

      if (!res.ok) throw new Error("Failed to start new chat");

      const data = (await res.json()) as { conversation: Conversation };
      setConversation(data.conversation);
      setMessages([]);
      setInput("");
      setError(null);
      setSuccess("New chat started! How can we help?");
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to start new chat");
    } finally {
      setSending(false);
    }
  }

  const displayedMessages = useMemo(() => {
    const merged = [...messages].sort(
      (a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime(),
    );
    return merged;
  }, [messages]);

  const lastMessageId = displayedMessages[displayedMessages.length - 1]?.id;

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth", block: "end" });
  }, [lastMessageId, botThinking]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <Loader className="animate-spin" size={32} />
      </div>
    );
  }

  if (!conversation) {
    return (
      <div className="min-h-screen">
        <SiteHeader />
        <main className="container-shell py-10">
          <div className="text-center">{error || "No conversation found"}</div>
        </main>
        <SiteFooter />
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <SiteHeader />
      <main className="flex-1 container-shell py-6">
        <div className="mx-auto grid max-w-6xl gap-5 lg:grid-cols-[1fr_320px]">
          <section className="flex h-[680px] flex-col overflow-hidden rounded-2xl border border-border bg-white shadow-lg">
            <div className="bg-slate-950 p-4 text-white">
              <div className="flex items-center justify-between gap-3">
                <div>
                  <h1 className="text-lg font-bold">Customer Support Chat</h1>
                  <p className="text-sm text-slate-300">
                    {conversation.status === "closed"
                      ? "Conversation closed"
                      : adminOnline ? "Admin is online" : "AI Assistant ready to help • Admin offline"}
                  </p>
                </div>
                <span className={`rounded-full px-3 py-1 text-xs font-semibold uppercase tracking-wide ${
                  conversation.status === "closed"
                    ? "bg-red-500/20 text-red-400 border border-red-500/30"
                    : "bg-white/10 text-white"
                }`}>
                  {conversation.status === "closed" ? "🔒 Closed" : "Open"}
                </span>
              </div>
            </div>

            <div className="border-b border-border bg-surface p-3">
              {conversation.status !== "closed" && (
                <div className="flex flex-wrap gap-2">
                  {quickPrompts.map((prompt) => (
                    <button
                      key={prompt}
                      type="button"
                      onClick={() => setInput(prompt)}
                      className="rounded-full border border-border bg-white px-3 py-1 text-xs font-semibold text-foreground/75 hover:bg-surface-soft"
                    >
                      {prompt}
                    </button>
                  ))}
                </div>
              )}
            </div>

            <div className="flex-1 space-y-4 overflow-y-auto bg-gray-50 p-4">
              {displayedMessages.length === 0 ? (
                <div className="flex h-full items-center justify-center text-center text-gray-500">
                  <div>
                    <MessageSquareText className="mx-auto mb-3" size={30} />
                    <p>Start a conversation with our support team.</p>
                  </div>
                </div>
              ) : (
                displayedMessages.map((msg) => {
                  const isCustomer = msg.sender_type === "customer";
                  const isBot = msg.sender_type === "bot";

                  return (
                    <div
                      key={msg.id}
                      className={`flex ${isCustomer ? "justify-end" : "justify-start"}`}
                    >
                      <div
                        className={`max-w-md rounded-lg px-4 py-2 ${
                          isCustomer
                            ? "rounded-br-none bg-slate-950 text-white"
                            : isBot
                              ? "rounded-bl-none border border-emerald-200 bg-emerald-50"
                              : "rounded-bl-none border border-gray-300 bg-white"
                        }`}
                      >
                        {!isCustomer && (
                          <p className={`mb-1 text-xs font-semibold ${isBot ? "text-emerald-700" : "text-blue-600"}`}>
                            {msg.sender_name}
                          </p>
                        )}
                        <p className="text-sm">{msg.message}</p>
                        <p className="mt-1 text-xs opacity-70">
                          {new Date(msg.created_at).toLocaleTimeString()}
                        </p>
                      </div>
                    </div>
                  );
                })
              )}

              {botThinking && (
                <div className="flex justify-start">
                  <div className="rounded-lg rounded-bl-none border border-emerald-200 bg-emerald-50 px-4 py-2 text-sm text-emerald-700">
                    AI Assistant is processing your message...
                  </div>
                </div>
              )}

              <div ref={messagesEndRef} />
            </div>

            <div className="border-t bg-white p-4">
              {conversation.status === "closed" ? (
                <div className="space-y-3">
                  <div className="rounded-lg bg-amber-50 p-4 text-center">
                    <p className="text-sm font-semibold text-amber-900">This conversation has been closed.</p>
                    <p className="mt-1 text-xs text-amber-800">You can start a new chat to continue getting support.</p>
                  </div>
                  <button
                    onClick={() => void startNewChat()}
                    disabled={sending}
                    className="w-full rounded-lg bg-brand px-4 py-2.5 text-sm font-bold text-white transition-colors hover:bg-brand-deep disabled:cursor-not-allowed disabled:opacity-50"
                  >
                    {sending ? "Starting..." : "Start New Chat"}
                  </button>
                </div>
              ) : (
                <div className="flex gap-3">
                  <input
                    type="text"
                    value={input}
                    onChange={(e) => setInput(e.target.value)}
                    onKeyDown={(e) => {
                      if (e.key === "Enter") {
                        e.preventDefault();
                        handleSend();
                      }
                    }}
                    placeholder="Describe your issue..."
                    className="flex-1 rounded-lg border border-gray-300 px-4 py-2 focus:outline-none focus:ring-2 focus:ring-slate-950"
                    disabled={sending}
                  />
                  <button
                    onClick={handleSend}
                    disabled={sending || !input.trim()}
                    className="rounded-lg bg-slate-950 p-2 text-white transition-colors hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-50"
                    aria-label="Send message"
                  >
                    {sending ? <Loader size={20} className="animate-spin" /> : <Send size={20} />}
                  </button>
                </div>
              )}
            </div>
          </section>

          <aside className="space-y-4">
            <article className="glass-card rounded-2xl p-5">
              <h2 className="text-sm font-bold uppercase tracking-wide text-foreground/60">Support Status</h2>
              <div className="mt-3 space-y-2 text-sm">
                <p>
                  <span className="font-semibold">Live Admin:</span> {adminOnline ? "Online" : "Offline"}
                </p>
                <p>
                  <span className="font-semibold">Conversation:</span> {conversation.status}
                </p>
                <p>
                  <span className="font-semibold">Expected Reply:</span> {adminOnline ? "Within minutes" : "As soon as an agent is online"}
                </p>
              </div>
            </article>

            <article className="glass-card rounded-2xl p-5">
              <div className="flex items-center gap-2">
                <Sparkles size={16} className="text-emerald-600" />
                <h2 className="text-sm font-bold uppercase tracking-wide text-foreground/60">AI Assistant</h2>
              </div>
              <p className="mt-3 text-sm text-foreground/75">
                Our AI-powered assistant provides instant answers to common questions about orders, payments, shipping, refunds, and account issues. Human agents respond when available.
              </p>
              <p className="mt-3 rounded-lg border border-emerald-200 bg-emerald-50 px-3 py-2 text-xs text-emerald-800">
                Quick call commands: @ai, @bot, @chatbot, @assistant. For human support, type @admin or @agent.
              </p>
            </article>
          </aside>
        </div>

        {success && (
          <div className="mt-4 rounded-lg bg-emerald-50 p-4 text-sm text-emerald-700">
            {success}
          </div>
        )}

        {error && (
          <div className="mt-4 rounded-lg bg-red-50 p-4 text-sm text-red-700">
            {error}
          </div>
        )}
      </main>
      <SiteFooter />
    </div>
  );
}
