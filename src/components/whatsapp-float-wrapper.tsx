"use client";

import dynamic from "next/dynamic";

const WhatsAppFloat = dynamic(
  () => import("@/components/whatsapp-float").then((mod) => mod.WhatsAppFloat),
  { ssr: false },
);

export function WhatsAppFloatWrapper() {
  return <WhatsAppFloat />;
}
