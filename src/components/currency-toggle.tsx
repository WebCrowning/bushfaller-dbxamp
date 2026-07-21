"use client";

import { useCart } from "@/context/cart-context";

export function CurrencyToggle() {
  const { currency, setCurrency } = useCart();

  return (
    <div className="inline-flex rounded-full border border-border bg-surface p-1 text-xs font-semibold">
      <button
        type="button"
        className={`rounded-full px-3 py-1 ${currency === "USD" ? "bg-brand text-white" : "text-foreground/70"}`}
        onClick={() => setCurrency("USD")}
      >
        USD
      </button>
      <button
        type="button"
        className={`rounded-full px-3 py-1 ${currency === "XAF" ? "bg-brand text-white" : "text-foreground/70"}`}
        onClick={() => setCurrency("XAF")}
      >
        XAF
      </button>
    </div>
  );
}
