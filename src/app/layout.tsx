import type { Metadata } from "next";
import { AppProviders } from "@/components/app-providers";
import { WhatsAppFloatWrapper } from "@/components/whatsapp-float-wrapper";
import { ChatbotProvider } from "@/components/chatbot-provider";
import { CookiesPolicy } from "@/components/cookies-policy";
import { TrafficTracker } from "@/components/traffic-tracker";
import "./globals.css";

export const metadata: Metadata = {
  metadataBase: new URL("https://bushbuyer.com"),
  title: "Bushbuyer | Premium African Raw Food Marketplace",
  description:
    "Shop authentic African raw food ingredients including snails, dry fish, and eru with fast delivery worldwide. Direct from trusted suppliers.",
  keywords: "African food, raw ingredients, snails, dry fish, eru, African marketplace",
  authors: [{ name: "Bushbuyer" }],
  creator: "Bushbuyer",
  publisher: "Bushbuyer",
  robots: {
    index: true,
    follow: true,
    "max-image-preview": "large",
    "max-snippet": -1,
    "max-video-preview": -1,
  },
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://bushbuyer.com",
    title: "Bushbuyer | Premium African Raw Food Marketplace",
    description: "Shop authentic African raw food ingredients with worldwide delivery",
    siteName: "Bushbuyer",
    images: [
      {
        url: "/images/og-image.jpg",
        width: 1200,
        height: 630,
        alt: "Bushbuyer - African Raw Food Marketplace",
        type: "image/jpeg",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "Bushbuyer | Premium African Raw Food Marketplace",
    description: "Shop authentic African raw food ingredients with worldwide delivery",
    images: ["/images/og-image.jpg"],
  },
  icons: {
    icon: [
      { url: "/favicon.ico", sizes: "any" },
      { url: "/icon.svg", type: "image/svg+xml" },
    ],
    apple: "/apple-icon.png",
  },
  manifest: "/site.webmanifest",
  alternates: {
    canonical: "https://bushbuyer.com",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      data-scroll-behavior="smooth"
      className="h-full antialiased"
    >
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#1a3a2a" />
        <script
          dangerouslySetInnerHTML={{
            __html: `
              window.addEventListener('error', function(e) {
                if (e && e.message && (e.message.indexOf('ChunkLoadError') !== -1 || e.message.indexOf('Loading chunk') !== -1)) {
                  window.location.reload();
                }
              }, true);
            `,
          }}
        />
      </head>
      <body className="min-h-full flex flex-col">
        <AppProviders>
          <TrafficTracker />
          {children}
          <WhatsAppFloatWrapper />
          <ChatbotProvider />
          <CookiesPolicy />
        </AppProviders>
      </body>
    </html>
  );
}
