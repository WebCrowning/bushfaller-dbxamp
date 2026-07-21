type RateLimitEntry = {
  count: number;
  windowStart: number;
};

type RateLimitOptions = {
  key: string;
  windowMs: number;
  maxRequests: number;
};

type RateLimitResult = {
  allowed: boolean;
  retryAfterSeconds: number;
};

const store = new Map<string, RateLimitEntry>();

function cleanupExpiredEntries(now: number, windowMs: number) {
  for (const [key, entry] of store.entries()) {
    if (now - entry.windowStart > windowMs * 2) {
      store.delete(key);
    }
  }
}

export function checkRateLimit(options: RateLimitOptions): RateLimitResult {
  const { key, windowMs, maxRequests } = options;
  const now = Date.now();

  cleanupExpiredEntries(now, windowMs);

  const existing = store.get(key);
  if (!existing) {
    store.set(key, { count: 1, windowStart: now });
    return { allowed: true, retryAfterSeconds: 0 };
  }

  const elapsed = now - existing.windowStart;
  if (elapsed > windowMs) {
    store.set(key, { count: 1, windowStart: now });
    return { allowed: true, retryAfterSeconds: 0 };
  }

  if (existing.count >= maxRequests) {
    const retryAfterSeconds = Math.max(1, Math.ceil((windowMs - elapsed) / 1000));
    return { allowed: false, retryAfterSeconds };
  }

  existing.count += 1;
  store.set(key, existing);
  return { allowed: true, retryAfterSeconds: 0 };
}
