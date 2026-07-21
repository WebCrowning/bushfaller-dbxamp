"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { X } from "lucide-react";

export function CookiesPolicy() {
  const [showBanner, setShowBanner] = useState(false);

  useEffect(() => {
    const cookiesConsent = localStorage.getItem("bushfaller_cookies_consent");
    setShowBanner(!cookiesConsent);
  }, []);

  const handleAccept = () => {
    localStorage.setItem("bushfaller_cookies_consent", "accepted");
    setShowBanner(false);
  };

  const handleDecline = () => {
    localStorage.setItem("bushfaller_cookies_consent", "declined");
    setShowBanner(false);
  };

  if (!showBanner) {
    return null;
  }

  return (
    <div className="fixed bottom-0 left-0 right-0 z-50 bg-slate-950/95 backdrop-blur-md border-t border-slate-800/90 p-4 md:p-6">
      <div className="container-shell">
        <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
          <div className="flex-1">
            <h3 className="text-lg font-bold text-white mb-2">We Respect Your Privacy</h3>
            <p className="text-sm text-white/80">
              We use cookies to enhance your experience, analyze site traffic, and serve personalized content. 
              By clicking &quot;Accept&quot;, you consent to our use of cookies. 
              <Link href="/privacy" className="text-blue-400 hover:text-blue-300 ml-1">
                Learn more
              </Link>
            </p>
          </div>

          <div className="flex gap-3 flex-shrink-0">
            <button
              onClick={handleDecline}
              className="px-4 py-2 text-sm font-medium text-white border border-slate-600 rounded-lg hover:bg-slate-800 transition-colors whitespace-nowrap"
            >
              Decline
            </button>
            <button
              onClick={handleAccept}
              className="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors whitespace-nowrap"
            >
              Accept
            </button>
          </div>

          <button
            onClick={() => setShowBanner(false)}
            className="md:hidden absolute top-3 right-3 text-white/60 hover:text-white transition-colors"
            aria-label="Close cookies banner"
          >
            <X size={20} />
          </button>
        </div>
      </div>
    </div>
  );
}
