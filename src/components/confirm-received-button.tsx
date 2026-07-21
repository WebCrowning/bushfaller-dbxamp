"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

type ConfirmReceivedButtonProps = {
  orderId: string;
};

export function ConfirmReceivedButton({ orderId }: ConfirmReceivedButtonProps) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState<string | null>(null);
  const [isError, setIsError] = useState(false);

  async function confirmReceived() {
    setLoading(true);
    setMessage(null);
    setIsError(false);

    try {
      const response = await fetch(`/api/orders/${orderId}/confirm-received`, {
        method: "PATCH",
      });

      const payload = (await response.json().catch(() => ({}))) as {
        error?: string;
        alreadyConfirmed?: boolean;
      };

      if (!response.ok) {
        setIsError(true);
        setMessage(payload.error || "Failed to confirm package receipt.");
        return;
      }

      setMessage(
        payload.alreadyConfirmed
          ? "Package receipt already confirmed."
          : "Thank you. You have confirmed package receipt.",
      );
      router.refresh();
    } catch {
      setIsError(true);
      setMessage("Failed to confirm package receipt.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-4">
      <p className="text-sm font-semibold text-emerald-900">Package delivered</p>
      <p className="mt-1 text-xs text-emerald-800">
        Please confirm when you have received the package.
      </p>
      <button
        type="button"
        onClick={() => {
          void confirmReceived();
        }}
        disabled={loading}
        className="mt-3 rounded-lg bg-emerald-600 px-4 py-2 text-sm font-semibold text-white hover:bg-emerald-700 disabled:cursor-not-allowed disabled:opacity-60"
      >
        {loading ? "Confirming..." : "Confirm Package Received"}
      </button>
      {message ? (
        <p className={`mt-2 text-xs ${isError ? "text-red-700" : "text-emerald-900"}`}>{message}</p>
      ) : null}
    </div>
  );
}
