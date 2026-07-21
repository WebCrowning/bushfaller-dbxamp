"use client";

import { useEffect, useState } from "react";
import { Loader, MessageSquare, UserCheck, X } from "lucide-react";
import { useRouter, useSearchParams } from "next/navigation";

interface Conversation {
  id: number;
  customer_id: number;
  customer_name: string;
  customer_email: string;
  assigned_admin_id: number | null;
  admin_name?: string;
  status: string;
  message_count: number;
  created_at: string;
  updated_at: string;
}

interface PaginationData {
  page: number;
  limit: number;
  total: number;
  pages: number;
}

interface AdminChatMessage {
  id: string;
  sender_id: number;
  sender_type: "customer" | "admin" | "bot";
  sender_name: string;
  message: string;
  created_at: string;
}

export default function AdminChatDashboard() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [conversations, setConversations] = useState<Conversation[]>([]);
  const [selectedConv, setSelectedConv] = useState<Conversation | null>(null);
  const [messages, setMessages] = useState<AdminChatMessage[]>([]);
  const [loading, setLoading] = useState(true);
  const [status, setStatus] = useState<"open" | "taken" | "all">("open");
  const [page, setPage] = useState(1);
  const [pagination, setPagination] = useState<PaginationData | null>(null);
  const [input, setInput] = useState("");
  const [sending, setSending] = useState(false);
  const [taking, setTaking] = useState(false);
  const [closing, setClosing] = useState(false);
  const [reopening, setReopening] = useState(false);
  const targetConversationId = Number(searchParams.get("conversationId") ?? 0);

  useEffect(() => {
    if (targetConversationId > 0 && status !== "all") {
      setStatus("all");
      setPage(1);
    }
  }, [targetConversationId, status]);

  useEffect(() => {
    fetchConversations();
  }, [status, page]);

  useEffect(() => {
    if (!targetConversationId || conversations.length === 0) {
      return;
    }

    const match = conversations.find((conv) => conv.id === targetConversationId);
    if (!match) {
      return;
    }

    setSelectedConv(match);
    void fetchMessages(match.id);
  }, [targetConversationId, conversations]);

  useEffect(() => {
    if (!targetConversationId) {
      return;
    }

    if (selectedConv?.id === targetConversationId) {
      return;
    }

    const alreadyInList = conversations.some((conv) => conv.id === targetConversationId);
    if (alreadyInList) {
      return;
    }

    async function loadConversationById() {
      try {
        const res = await fetch(`/api/admin-chat/admin-conversations/${targetConversationId}`);
        if (!res.ok) {
          return;
        }

        const data = (await res.json()) as { conversation: Conversation };
        const conv = data.conversation;
        setConversations((prev) =>
          prev.some((item) => item.id === conv.id) ? prev : [conv, ...prev],
        );
        setSelectedConv(conv);
        await fetchMessages(conv.id);
      } catch (err) {
        console.error("Error loading conversation by id:", err);
      }
    }

    void loadConversationById();
  }, [targetConversationId, selectedConv?.id, conversations]);

  function openConversation(conv: Conversation) {
    setSelectedConv(conv);
    void fetchMessages(conv.id);
    router.replace(`/admin/chat?conversationId=${conv.id}`);
  }

  useEffect(() => {
    if (selectedConv?.id) {
      const interval = setInterval(() => {
        fetchMessages(selectedConv.id);
      }, 2000);
      return () => clearInterval(interval);
    }
  }, [selectedConv?.id]);

  async function fetchConversations() {
    setLoading(true);
    try {
      const res = await fetch(
        `/api/admin-chat/admin-conversations?status=${status}&page=${page}&limit=20`,
      );
      if (!res.ok) throw new Error("Failed to fetch conversations");
      const data = (await res.json()) as {
        conversations: Conversation[];
        pagination: PaginationData;
      };
      setConversations(data.conversations);
      setPagination(data.pagination);
    } catch (err) {
      console.error("Error fetching conversations:", err);
    } finally {
      setLoading(false);
    }
  }

  async function fetchMessages(convId: number) {
    try {
      const res = await fetch(
        `/api/admin-chat/conversations/${convId}/messages`,
      );
      if (!res.ok) throw new Error("Failed to fetch messages");
      const data = (await res.json()) as { messages: AdminChatMessage[] };
      setMessages(data.messages);
    } catch (err) {
      console.error("Error fetching messages:", err);
    }
  }

  async function handleTakeConversation() {
    if (!selectedConv?.id) return;
    setTaking(true);
    try {
      const res = await fetch(
        `/api/admin-chat/conversations/${selectedConv.id}/take`,
        { method: "POST" },
      );
      if (!res.ok) {
        const error = await res.json();
        throw new Error(error.error || "Failed to take conversation");
      }
      await fetchConversations();
      if (selectedConv) {
        const updated = conversations.find((c) => c.id === selectedConv.id);
        if (updated) setSelectedConv(updated);
      }
    } catch (err) {
      console.error("Error taking conversation:", err);
      alert("Error taking conversation");
    } finally {
      setTaking(false);
    }
  }

  async function handleCloseConversation() {
    if (!selectedConv?.id) return;
    if (!confirm("Close this conversation?")) return;

    setClosing(true);
    try {
      const res = await fetch(
        `/api/admin-chat/conversations/${selectedConv.id}/close`,
        { method: "POST" },
      );
      if (!res.ok) {
        const error = await res.json();
        throw new Error(error.error || "Failed to close conversation");
      }
      setSelectedConv(null);
      setMessages([]);
      setInput("");
      await fetchConversations();
    } catch (err) {
      console.error("Error closing conversation:", err);
      alert("Error closing conversation");
    } finally {
      setClosing(false);
    }
  }

  async function handleReopenConversation() {
    if (!selectedConv?.id) return;

    setReopening(true);
    try {
      const res = await fetch(
        `/api/admin-chat/conversations/${selectedConv.id}/reopen`,
        { method: "POST" },
      );

      if (!res.ok) {
        const error = await res.json().catch(() => ({ error: "Failed to reopen conversation" }));
        throw new Error(error.error || "Failed to reopen conversation");
      }

      setSelectedConv((prev) => (prev ? { ...prev, status: "taken" } : prev));
      await fetchConversations();
    } catch (err) {
      console.error("Error reopening conversation:", err);
      alert("Error reopening conversation");
    } finally {
      setReopening(false);
    }
  }

  async function handleSendMessage() {
    if (!input.trim() || !selectedConv?.id) return;
    setSending(true);
    try {
      const res = await fetch(
        `/api/admin-chat/conversations/${selectedConv.id}/messages`,
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ message: input }),
        },
      );
      if (!res.ok) {
        const error = await res.json();
        throw new Error(error.error || "Failed to send message");
      }
      setInput("");
      await fetchMessages(selectedConv.id);
    } catch (err) {
      console.error("Error sending message:", err);
      alert("Error sending message");
    } finally {
      setSending(false);
    }
  }

  return (
    <div className="min-h-screen bg-gray-100">
      <div className="flex h-screen">
        {/* Conversations List */}
        <div className="w-96 bg-white border-r border-gray-300 flex flex-col">
          {/* Header */}
          <div className="p-4 border-b border-gray-300">
            <h1 className="text-xl font-bold text-gray-800 mb-4">
              Customer Support
            </h1>

            <div className="flex gap-2">
              {(["open", "taken", "all"] as const).map((s) => (
                <button
                  key={s}
                  onClick={() => {
                    setStatus(s);
                    setPage(1);
                  }}
                  className={`px-3 py-1 rounded text-sm font-medium transition-colors ${
                    status === s
                      ? "bg-blue-600 text-white"
                      : "bg-gray-200 text-gray-700 hover:bg-gray-300"
                  }`}
                >
                  {s === "open"
                    ? "Open"
                    : s === "taken"
                      ? "Taken"
                      : "All"}
                </button>
              ))}
            </div>
          </div>

          {/* List */}
          <div className="flex-1 overflow-y-auto">
            {loading ? (
              <div className="flex justify-center items-center h-full">
                <Loader className="animate-spin" size={32} />
              </div>
            ) : conversations.length === 0 ? (
              <div className="p-4 text-center text-gray-500">
                No conversations
              </div>
            ) : (
              conversations.map((conv) => (
                <button
                  key={conv.id}
                  type="button"
                  onClick={() => openConversation(conv)}
                  className={`w-full p-4 border-b border-gray-200 text-left hover:bg-gray-50 transition-colors ${
                    selectedConv?.id === conv.id ? "bg-blue-50" : ""
                  }`}
                >
                  <div className="flex items-start justify-between">
                    <div className="flex-1">
                      <h3 className="font-semibold text-gray-900">
                        {conv.customer_name}
                      </h3>
                      <p className="text-sm text-gray-600">
                        {conv.customer_email}
                      </p>
                      <p className="text-xs text-gray-500 mt-1">
                        Messages: {conv.message_count}
                      </p>
                    </div>
                    <span
                      className={`text-xs px-2 py-1 rounded font-semibold ${
                        conv.status === "open"
                          ? "bg-yellow-100 text-yellow-800"
                          : conv.status === "taken"
                            ? "bg-blue-100 text-blue-800"
                            : "bg-gray-100 text-gray-800"
                      }`}
                    >
                      {conv.status}
                    </span>
                  </div>
                  {conv.admin_name && (
                    <p className="text-xs text-blue-600 mt-2">
                      Assigned: {conv.admin_name}
                    </p>
                  )}
                </button>
              ))
            )}
          </div>

          {/* Pagination */}
          {pagination && pagination.pages > 1 && (
            <div className="p-4 border-t border-gray-300 flex gap-2 justify-center">
              <button
                onClick={() => setPage(Math.max(1, page - 1))}
                disabled={page === 1}
                className="px-3 py-1 bg-gray-300 rounded disabled:opacity-50"
              >
                Prev
              </button>
              <span className="px-3 py-1">
                {page} / {pagination.pages}
              </span>
              <button
                onClick={() =>
                  setPage(Math.min(pagination.pages, page + 1))
                }
                disabled={page === pagination.pages}
                className="px-3 py-1 bg-gray-300 rounded disabled:opacity-50"
              >
                Next
              </button>
            </div>
          )}
        </div>

        {/* Chat Area */}
        <div className="flex-1 flex flex-col bg-white">
          {selectedConv ? (
            <>
              {/* Header */}
              <div className="p-4 border-b border-gray-300 flex items-center justify-between bg-gray-50">
                <div>
                  <h2 className="text-lg font-bold text-gray-900">
                    {selectedConv.customer_name}
                  </h2>
                  <p className="text-sm text-gray-600">
                    {selectedConv.customer_email}
                  </p>
                </div>
                <div className="flex gap-2">
                  {selectedConv.status === "open" && (
                    <button
                      onClick={handleTakeConversation}
                      disabled={taking}
                      className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50 flex items-center gap-2 font-medium text-sm"
                    >
                      {taking ? (
                        <>
                          <Loader size={16} className="animate-spin" />
                          Taking...
                        </>
                      ) : (
                        <>
                          <UserCheck size={16} />
                          Take Chat
                        </>
                      )}
                    </button>
                  )}
                  {selectedConv.status === "taken" && (
                    <button
                      onClick={handleCloseConversation}
                      disabled={closing}
                      className="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:opacity-50 flex items-center gap-2 font-medium text-sm"
                    >
                      {closing ? (
                        <>
                          <Loader size={16} className="animate-spin" />
                          Closing...
                        </>
                      ) : (
                        <>
                          <X size={16} />
                          Close Chat
                        </>
                      )}
                    </button>
                  )}
                  {selectedConv.status === "closed" && (
                    <button
                      onClick={handleReopenConversation}
                      disabled={reopening}
                      className="px-4 py-2 bg-emerald-600 text-white rounded-lg hover:bg-emerald-700 disabled:opacity-50 flex items-center gap-2 font-medium text-sm"
                    >
                      {reopening ? (
                        <>
                          <Loader size={16} className="animate-spin" />
                          Reopening...
                        </>
                      ) : (
                        <>
                          <UserCheck size={16} />
                          Reopen Chat
                        </>
                      )}
                    </button>
                  )}
                </div>
              </div>

              {/* Messages */}
              <div className="flex-1 overflow-y-auto p-4 space-y-4 bg-gray-50">
                {messages.map((msg) => (
                  <div
                    key={msg.id}
                    className={`flex ${
                      msg.sender_type === "customer"
                        ? "justify-start"
                        : "justify-end"
                    }`}
                  >
                    <div
                      className={`max-w-sm px-4 py-2 rounded-lg ${
                        msg.sender_type === "customer"
                          ? "bg-white border border-gray-300 rounded-bl-none"
                          : msg.sender_type === "admin"
                            ? "bg-blue-600 text-white rounded-br-none"
                            : "bg-green-100 text-green-900 border border-green-300 rounded-br-none"
                      }`}
                    >
                      {msg.sender_type === "customer" && (
                        <p className="text-xs font-semibold text-gray-600 mb-1">
                          {msg.sender_name}
                        </p>
                      )}
                      {msg.sender_type === "admin" && (
                        <p className="text-xs font-semibold text-blue-100 mb-1">
                          Admin
                        </p>
                      )}
                      {msg.sender_type === "bot" && (
                        <p className="text-xs font-semibold text-green-700 mb-1">
                          AI Assistant
                        </p>
                      )}
                      <p className="text-sm">{msg.message}</p>
                    </div>
                  </div>
                ))}
              </div>

              {/* Input */}
              <div className="p-4 border-t border-gray-300 bg-white">
                {selectedConv.status === "closed" ? (
                  <div className="text-center text-gray-500">
                    This chat is closed
                  </div>
                ) : selectedConv.status === "open" ? (
                  <div className="text-center text-gray-500 text-sm">
                    Take this chat to start responding
                  </div>
                ) : (
                  <div className="flex gap-3">
                    <input
                      type="text"
                      value={input}
                      onChange={(e) => setInput(e.target.value)}
                      onKeyPress={(e) => {
                        if (e.key === "Enter") handleSendMessage();
                      }}
                      placeholder="Type a message..."
                      className="flex-1 border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600"
                      disabled={sending}
                    />
                    <button
                      onClick={handleSendMessage}
                      disabled={sending || !input.trim()}
                      className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed font-medium"
                    >
                      {sending ? "..." : "Send"}
                    </button>
                  </div>
                )}
              </div>
            </>
          ) : (
            <div className="flex items-center justify-center h-full">
              <div className="text-center text-gray-500">
                <MessageSquare size={48} className="mx-auto mb-4 opacity-50" />
                <p>Select a conversation to start chatting</p>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
