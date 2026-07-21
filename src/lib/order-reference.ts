import crypto from "crypto";

const ORDER_REFERENCE_PREFIX = "BF";
const ORDER_REFERENCE_REGEX = /^BF-\d{8}-[A-Z0-9]{10}$/;
const RANDOM_ALPHABET = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

function buildRandomSegment(length: number) {
  const randomBytes = crypto.randomBytes(length);
  let out = "";

  for (let i = 0; i < length; i += 1) {
    out += RANDOM_ALPHABET[randomBytes[i] % RANDOM_ALPHABET.length];
  }

  return out;
}

export function generateOrderReference(date = new Date()) {
  const year = date.getUTCFullYear();
  const month = String(date.getUTCMonth() + 1).padStart(2, "0");
  const day = String(date.getUTCDate()).padStart(2, "0");
  const datePart = `${year}${month}${day}`;
  const randomPart = buildRandomSegment(10);

  return `${ORDER_REFERENCE_PREFIX}-${datePart}-${randomPart}`;
}

export function isOrderReference(value: string) {
  return ORDER_REFERENCE_REGEX.test(value);
}
