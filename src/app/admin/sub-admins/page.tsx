"use client";

import { useEffect, useState } from "react";
import { UserPlus, Trash2, Loader } from "lucide-react";

interface SubAdmin {
  id: number;
  name: string;
  email: string;
  role: string;
  created_at: string;
}

interface ApiResponse {
  subAdmins?: SubAdmin[];
  error?: string;
}

export default function SubAdminsPage() {
  const [subAdmins, setSubAdmins] = useState<SubAdmin[]>([]);
  const [loading, setLoading] = useState(true);
  const [email, setEmail] = useState("");
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    fetchSubAdmins();
  }, []);

  async function fetchSubAdmins() {
    try {
      const res = await fetch("/api/admin/sub-admins");
      if (!res.ok) {
        const data = (await res.json()) as ApiResponse;
        throw new Error(data.error || "Failed to load sub-admins");
      }
      const data = (await res.json()) as ApiResponse;
      setSubAdmins(data.subAdmins || []);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load sub-admins");
    } finally {
      setLoading(false);
    }
  }

  async function handleAddSubAdmin(e: React.FormEvent) {
    e.preventDefault();
    if (!email.trim()) {
      setError("Email is required");
      return;
    }

    setSubmitting(true);
    setError(null);
    setSuccess(null);

    try {
      const res = await fetch("/api/admin/sub-admins", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }),
      });

      const data = (await res.json()) as ApiResponse & { message?: string };

      if (!res.ok) {
        throw new Error(data.error || "Failed to add sub-admin");
      }

      setSuccess("Sub-admin added successfully!");
      setEmail("");
      await fetchSubAdmins();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to add sub-admin");
    } finally {
      setSubmitting(false);
    }
  }

  async function handleRemoveSubAdmin(id: number) {
    if (!confirm("Remove this sub-admin?")) return;

    try {
      const res = await fetch(`/api/admin/sub-admins?id=${id}`, {
        method: "DELETE",
      });

      if (!res.ok) {
        const data = (await res.json()) as ApiResponse;
        throw new Error(data.error || "Failed to remove sub-admin");
      }

      setSuccess("Sub-admin removed successfully!");
      await fetchSubAdmins();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to remove sub-admin");
    }
  }

  if (loading) {
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
      <div className="max-w-4xl mx-auto">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Manage Sub-Admins</h1>

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

        {/* Add Sub-Admin Form */}
        <div className="bg-white rounded-lg shadow-md p-6 mb-8">
          <h2 className="text-xl font-semibold text-gray-800 mb-4">Add New Sub-Admin</h2>
          <form onSubmit={handleAddSubAdmin} className="flex gap-3">
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="Enter user email to promote to sub-admin"
              className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              disabled={submitting}
            />
            <button
              type="submit"
              disabled={submitting || !email.trim()}
              className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors flex items-center gap-2 font-medium"
            >
              {submitting ? (
                <>
                  <Loader size={18} className="animate-spin" />
                  Adding...
                </>
              ) : (
                <>
                  <UserPlus size={18} />
                  Add Sub-Admin
                </>
              )}
            </button>
          </form>
          <p className="text-sm text-gray-600 mt-3">
            ⚠️ Note: You can only promote existing users. Sub-admins can block users but not other admins or sub-admins.
          </p>
        </div>

        {/* Sub-Admins List */}
        <div className="bg-white rounded-lg shadow-md overflow-hidden">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-xl font-semibold text-gray-900">
              Active Sub-Admins ({subAdmins.length})
            </h2>
          </div>

          {subAdmins.length === 0 ? (
            <div className="px-6 py-8 text-center text-gray-600">
              No sub-admins yet. Add one to get started.
            </div>
          ) : (
            <div className="divide-y divide-gray-200">
              {subAdmins.map((subAdmin) => (
                <div key={subAdmin.id} className="px-6 py-4 hover:bg-gray-50 transition-colors">
                  <div className="flex items-start justify-between">
                    <div>
                      <h3 className="font-semibold text-gray-900">{subAdmin.name}</h3>
                      <p className="text-sm text-gray-600 mt-1">{subAdmin.email}</p>
                      <p className="text-xs text-gray-500 mt-2">
                        Promoted: {new Date(subAdmin.created_at).toLocaleDateString()}
                      </p>
                    </div>
                    <button
                      onClick={() => handleRemoveSubAdmin(subAdmin.id)}
                      className="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors flex items-center gap-2 text-sm font-medium"
                      title="Remove sub-admin status"
                    >
                      <Trash2 size={16} />
                      Remove
                    </button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
