"use client";

import { useEffect, useRef } from "react";
import { usePathname, useSearchParams } from "next/navigation";

function getPageLoadMs() {
  if (typeof window === "undefined" || !window.performance) {
    return null;
  }

  const navEntry = window.performance.getEntriesByType("navigation")[0] as PerformanceNavigationTiming | undefined;
  if (navEntry && Number.isFinite(navEntry.loadEventEnd)) {
    return Math.max(0, Math.round(navEntry.loadEventEnd));
  }

  return Math.max(0, Math.round(window.performance.now()));
}

export function TrafficTracker() {
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const lastTrackedRef = useRef<string>("");

  useEffect(() => {
    const route = `${pathname}${searchParams?.toString() ? `?${searchParams.toString()}` : ""}`;
    if (!route || lastTrackedRef.current === route) {
      return;
    }

    lastTrackedRef.current = route;

    const payload = {
      path: route,
      referrer: document.referrer || null,
      userAgent: navigator.userAgent,
      loadMs: getPageLoadMs(),
    };

    const body = JSON.stringify(payload);

    if (navigator.sendBeacon) {
      const blob = new Blob([body], { type: "application/json" });
      navigator.sendBeacon("/api/analytics/traffic", blob);
      return;
    }

    void fetch("/api/analytics/traffic", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body,
      keepalive: true,
    }).catch(() => undefined);
  }, [pathname, searchParams]);

  return null;
}
