import Link from "next/link";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";

type Props = {
  searchParams: Promise<{ orderId?: string }>;
};

export default async function CheckoutSuccessPage({ searchParams }: Props) {
  const { orderId } = await searchParams;

  return (
    <div className="min-h-screen">
      <SiteHeader />
      <main className="container-shell py-16">
        <div className="glass-card mx-auto max-w-2xl rounded-3xl p-10 text-center">
          <p className="section-kicker">Order Confirmed</p>
          <h1 className="mt-3 text-3xl font-bold text-brand-deep">Thank you for your purchase!</h1>
          <p className="mt-3 text-sm text-foreground/70">
            Your order has been received and payment verified.
          </p>
          {orderId ? <p className="mt-3 text-sm font-semibold">Order Reference: {orderId}</p> : null}
          <div className="mt-7 flex flex-wrap justify-center gap-3">
            <Link href="/orders" className="rounded-full bg-brand px-5 py-2 text-sm font-semibold text-white">
              View My Orders
            </Link>
            <Link href="/products" className="rounded-full border border-border px-5 py-2 text-sm font-semibold">
              Continue Shopping
            </Link>
          </div>
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
