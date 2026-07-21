"use client";

import { useEffect, useState } from "react";
import { useSession } from "next-auth/react";
import { Lock, Unlock, Loader } from "lucide-react";

interface User {
  id: number;
  name: string;
  email: string;
  role: string;
  is_blocked: number;
  blocked_reason: string | null;
  created_at: string;
}

interface PaginationData {
  page: number;
  limit: number;
  total: number;
  pages: number;
}

interface ApiResponse {
  users?: User[];
  pagination?: PaginationData;
  error?: string;
}

export default function UsersManagementPage() {
  const { data: session } = useSession();
  const [users, setUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<"all" | "active" | "blocked">("all");
  const [page, setPage] = useState(1);
  const [pagination, setPagination] = useState<PaginationData | null>(null);
  const [blockingUserId, setBlockingUserId] = useState<number | null>(null);
  const [blockReason, setBlockReason] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    fetchUsers();
  }, [filter, page]);

  async function fetchUsers() {
    setLoading(true);
    try {
      let blockedParam = "";
      if (filter === "active") blockedParam = "&blocked=false";
      else if (filter === "blocked") blockedParam = "&blocked=true";

      const res = await fetch(`/api/admin/users?page=${page}&limit=20${blockedParam}`);
      if (!res.ok) {
        const data = (await res.json()) as ApiResponse;
        throw new Error(data.error || "Failed to load users");
      }
      const data = (await res.json()) as ApiResponse;
      setUsers(data.users || []);
      setPagination(data.pagination || null);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load users");
    } finally {
      setLoading(false);
    }
  }

  async function handleBlockUser(userId: number) {
    if (!blockReason.trim()) {
      alert("Please enter a reason for blocking");
      return;
    }

    try {
      const res = await fetch("/api/admin/users/block", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId, reason: blockReason }),
      });

      const data = (await res.json()) as ApiResponse & { message?: string };

      if (!res.ok) {
        throw new Error(data.error || "Failed to block user");
      }

      setSuccess("User blocked successfully!");
      setBlockingUserId(null);
      setBlockReason("");
      await fetchUsers();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to block user");
    }
  }

  async function handleUnblockUser(userId: number) {
    if (!confirm("Unblock this user?")) return;

    try {
      const res = await fetch(`/api/admin/users/block?id=${userId}`, {
        method: "DELETE",
      });

      const data = (await res.json()) as ApiResponse & { message?: string };

      if (!res.ok) {
        throw new Error(data.error || "Failed to unblock user");
      }

      setSuccess("User unblocked successfully!");
      await fetchUsers();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to unblock user");
    }
  }

  if (loading && users.length === 0) {
    return (
      <div className="min-h-screen bg-gray-50 p-8">
        <div className="flex justify-center">
          <Loader className="animate-spin text-gray-400" size={32} />
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-6xl mx-auto">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">User Management</h1>

        {error && (
          <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-6">
            {error}
          </div>
        )}
        {success && (
          <div className="bg-green-50 border border-green-200 text-green-700 px-4 py-3 rounded-lg mb-6">
            {success}
          </div>
        )}

        {/* Filter Tabs */}
        <div className="mb-6 flex gap-3">
          {(["all", "active", "blocked"] as const).map((f) => (
            <button
              key={f}
              onClick={() => {
                setFilter(f);
                setPage(1);
              }}
              className={`px-6 py-2 rounded-lg font-medium transition-colors ${
                filter === f
                  ? "bg-blue-600 text-white"
                  : "bg-white text-gray-700 border border-gray-300 hover:bg-gray-50"
              }`}
            >
              {f === "all"
                ? "All Users"
                : f === "active"
                  ? "Active"
                  : "Blocked"}
            </button>
          ))}
        </div>

        {/* Users List */}
        <div className="bg-white rounded-lg shadow-md overflow-hidden">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-xl font-semibold text-gray-900">
              {filter === "all"
                ? "All Users"
                : filter === "active"
                  ? "Active Users"
                  : "Blocked Users"}{" "}
              ({pagination?.total || 0})
            </h2>
          </div>

          {users.length === 0 ? (
            <div className="px-6 py-8 text-center text-gray-600">
              No users found in this category.
            </div>
          ) : (
            <div className="divide-y divide-gray-200">
              {users.map((user) => (
                <div key={user.id} className="px-6 py-4 hover:bg-gray-50 transition-colors">
                  <div className="flex items-start justify-between">
                    <div className="flex-1">
                      <h3 className="font-semibold text-gray-900">{user.name}</h3>
                      <p className="text-sm text-gray-600 mt-1">{user.email}</p>
                      {user.is_blocked ? (
                        <div className="mt-2">
                          <p className="text-xs font-semibold text-red-600 mb-1">
                            🚫 Blocked
                          </p>
                          {user.blocked_reason && (
                            <p className="text-xs text-gray-600">
                              Reason: {user.blocked_reason}
                            </p>
                          )}
                        </div>
                      ) : (
                        <p className="text-xs text-green-600 mt-2 font-semibold">
                          ✓ Active
                        </p>
                      )}
                      <p className="text-xs text-gray-500 mt-2">
                        Joined: {new Date(user.created_at).toLocaleDateString()}
                      </p>
                    </div>

                    <div className="flex gap-2 ml-4 flex-shrink-0">
                      {blockingUserId === user.id ? (
                        <div className="w-64 bg-white border border-gray-300 rounded-lg p-3 shadow-lg">
                          <label className="block text-sm font-medium text-gray-700 mb-2">
                            Block Reason
                          </label>
                          <textarea
                            value={blockReason}
                            onChange={(e) => setBlockReason(e.target.value)}
                            placeholder="Enter reason for blocking..."
                            className="w-full border border-gray-300 rounded px-2 py-1 text-sm mb-2 resize-none"
                            rows={3}
                          />
                          <div className="flex gap-2">
                            <button
                              onClick={() => handleBlockUser(user.id)}
                              className="flex-1 px-3 py-1 bg-red-600 text-white rounded text-sm font-medium hover:bg-red-700"
                            >
                              Confirm
                            </button>
                            <button
                              onClick={() => {
                                setBlockingUserId(null);
                                setBlockReason("");
                              }}
                              className="flex-1 px-3 py-1 bg-gray-300 text-gray-700 rounded text-sm font-medium hover:bg-gray-400"
                            >
                              Cancel
                            </button>
                          </div>
                        </div>
                      ) : (
                        <>
                          {user.is_blocked ? (
                            <button
                              onClick={() => handleUnblockUser(user.id)}
                              className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors flex items-center gap-2 text-sm font-medium"
                              title="Unblock user"
                            >
                              <Unlock size={16} />
                              Unblock
                            </button>
                          ) : (
                            <button
                              onClick={() => setBlockingUserId(user.id)}
                              disabled={user.email === session?.user?.email}
                              className="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors flex items-center gap-2 text-sm font-medium disabled:opacity-50 disabled:cursor-not-allowed"
                              title={user.email === session?.user?.email ? "Cannot block yourself" : "Block user"}
                            >
                              <Lock size={16} />
                              Block
                            </button>
                          )}
                        </>
                      )}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Pagination */}
        {pagination && pagination.pages > 1 && (
          <div className="mt-6 flex justify-center gap-2">
            <button
              onClick={() => setPage(Math.max(1, page - 1))}
              disabled={page === 1}
              className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              Previous
            </button>
            {Array.from({ length: pagination.pages }, (_, i) => i + 1).map((p) => (
              <button
                key={p}
                onClick={() => setPage(p)}
                className={`px-4 py-2 rounded-lg transition-colors ${
                  page === p
                    ? "bg-blue-600 text-white"
                    : "border border-gray-300 hover:bg-gray-50"
                }`}
              >
                {p}
              </button>
            ))}
            <button
              onClick={() => setPage(Math.min(pagination.pages, page + 1))}
              disabled={page === pagination.pages}
              className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              Next
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
