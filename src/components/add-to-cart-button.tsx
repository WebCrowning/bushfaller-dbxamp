"use client";

import { useState } from "react";
import type { Product } from "@/types";
import { useCart } from "@/context/cart-context";

export function AddToCartButton({
  product,
  quantity,
  className,
}: {
  product: Product;
  quantity?: number;
  className?: string;
}) {
  const { addItem } = useCart();
  const [added, setAdded] = useState(false);

  function onAdd() {
    addItem(product, quantity ?? 1);
    setAdded(true);
    setTimeout(() => setAdded(false), 1200);
  }

  return (
    <button
      type="button"
      onClick={onAdd}
      className={
        className ??
        "rounded-full bg-brand px-4 py-2 text-sm font-semibold text-white transition-colors hover:bg-brand-deep"
      }
    >
      {added ? "Added" : "Add to Cart"}
    </button>
  );
}
