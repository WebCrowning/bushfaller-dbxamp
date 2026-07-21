import clsx from "clsx";

export function cn(...classes: Array<string | false | null | undefined>) {
  return clsx(classes);
}

export function toId(value: string) {
  const parsed = Number(value);
  if (!Number.isInteger(parsed) || parsed <= 0) {
    return null;
  }
  return parsed;
}

export function formatCurrency(value: number, currency: "XAF" | "USD") {
  return new Intl.NumberFormat(currency === "XAF" ? "fr-CM" : "en-US", {
    style: "currency",
    currency,
    maximumFractionDigits: currency === "XAF" ? 0 : 2,
  }).format(value);
}
