import { NextResponse } from "next/server";

function normalizeOrigin(value: string) {
  return value.trim().toLowerCase().replace(/\/$/, "");
}

export function getClientIp(request: Request) {
  const forwardedFor = request.headers.get("x-forwarded-for");
  if (forwardedFor) {
    const first = forwardedFor.split(",")[0]?.trim();
    if (first) {
      return first;
    }
  }

  const realIp = request.headers.get("x-real-ip")?.trim();
  if (realIp) {
    return realIp;
  }

  return "unknown";
}

export function validateSameOrigin(request: Request) {
  const origin = request.headers.get("origin");
  const referer = request.headers.get("referer");
  const host = request.headers.get("host");
  const secFetchSite = (request.headers.get("sec-fetch-site") ?? "").toLowerCase();

  if (secFetchSite === "cross-site") {
    return NextResponse.json(
      { error: "Cross-site requests are not allowed" },
      { status: 403 },
    );
  }

  if (!host) {
    return null;
  }

  const protocol = host.startsWith("localhost") || host.startsWith("127.0.0.1") ? "http" : "https";
  const expectedOrigin = normalizeOrigin(`${protocol}://${host}`);

  if (!origin) {
    // For requests without Origin, fall back to Referer validation when present.
    if (referer) {
      try {
        const refererOrigin = normalizeOrigin(new URL(referer).origin);
        if (refererOrigin !== expectedOrigin) {
          return NextResponse.json(
            { error: "Invalid request origin" },
            { status: 403 },
          );
        }
      } catch {
        return NextResponse.json(
          { error: "Invalid request origin" },
          { status: 403 },
        );
      }
    }

    return null;
  }

  const incomingOrigin = normalizeOrigin(origin);

  if (incomingOrigin !== expectedOrigin) {
    return NextResponse.json(
      { error: "Invalid request origin" },
      { status: 403 },
    );
  }

  return null;
}

export function validateJsonRequest(request: Request) {
  const contentType = request.headers.get("content-type") ?? "";
  if (!contentType.toLowerCase().includes("application/json")) {
    return NextResponse.json(
      { error: "Unsupported content type" },
      { status: 415 },
    );
  }

  return null;
}
