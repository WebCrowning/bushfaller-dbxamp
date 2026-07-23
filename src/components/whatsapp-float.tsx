"use client";

import { useCart } from "@/context/cart-context";

export function WhatsAppFloat() {
  const { whatsappText } = useCart();

  return (
    <a
      href={`https://wa.me/237676068533?text=${encodeURIComponent(whatsappText)}`}
      target="_blank"
      rel="noreferrer"
      className="fixed right-4 bottom-4 z-40 rounded-full bg-brand px-5 py-3 text-sm font-bold text-white shadow-lg transition-colors hover:bg-brand-deep"
      aria-label="Contact Bushbuyer on WhatsApp"
    >
      WhatsApp Us
    </a>
  );
}
