import type { Metadata } from "next";
import { ContactPageClient } from "@/components/contact-page-client";

export const metadata: Metadata = {
  title: "Contact Us | Bushfaller",
  description: "Get in touch for partnerships, bulk orders, or customer support.",
  alternates: {
    canonical: "https://bushfaller.com/contact",
  },
};

export default function ContactPage() {
  return <ContactPageClient />;
}
