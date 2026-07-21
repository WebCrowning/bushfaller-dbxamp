"use client";

import Image from "next/image";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { signIn } from "next-auth/react";
import { FormEvent, useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";

function AdminLoginForm() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const error = searchParams.get("error");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [submitting, setSubmitting] = useState(false);
  const [formError, setFormError] = useState<string | null>(null);

  async function onSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setSubmitting(true);
    setFormError(null);

    const result = await signIn("credentials", {
      email,
      password,
      redirect: false,
      callbackUrl: "/admin",
    });

    setSubmitting(false);

    if (!result?.ok) {
      setFormError("Invalid admin email or password.");
      return;
    }

    router.push("/admin");
  }

  return (
    <>
      <div className="flex justify-center mb-6">
        <Image
          src="/images/logo.png"
          alt="Bushfaller logo"
          width={120}
          height={120}
          className="h-32 w-32 rounded-full object-cover"
          priority
        />
      </div>
      <p className="section-kicker text-center">Admin Access</p>
      <h1 className="mt-3 text-3xl font-bold text-brand-deep text-center">Admin Login</h1>
      <p className="mt-3 text-sm leading-6 text-foreground/75">
        Enter your admin email and password to access the dashboard.
      </p>

      {error === "forbidden" ? (
        <p className="mt-4 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          Access denied. Your account is not authorized for admin access.
        </p>
      ) : null}

      <form className="mt-8 space-y-3" onSubmit={onSubmit}>
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="Admin email"
          required
          className="w-full rounded-xl border border-border bg-surface px-4 py-3 text-sm outline-none focus:border-brand"
        />
        <input
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Password"
          required
          className="w-full rounded-xl border border-border bg-surface px-4 py-3 text-sm outline-none focus:border-brand"
        />
        <button
          type="submit"
          disabled={submitting}
          className="w-full rounded-xl bg-brand px-4 py-3 text-sm font-semibold text-white transition-colors hover:bg-brand-deep disabled:cursor-not-allowed disabled:opacity-70"
        >
          {submitting ? "Signing in..." : "Sign in as Admin"}
        </button>
      </form>

      {formError ? (
        <p className="mt-3 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {formError}
        </p>
      ) : null}

      <Link href="/" className="mt-5 inline-block text-sm font-semibold text-brand hover:text-brand-deep">
        Back to storefront
      </Link>
    </>
  );
}

export default function AdminLoginPage() {
  return (
    <div className="min-h-screen">
      <SiteHeader />
      <main className="container-shell py-16">
        <div className="glass-card mx-auto max-w-xl rounded-3xl p-8">
          <Suspense fallback={<div className="flex justify-center py-8">Loading...</div>}>
            <AdminLoginForm />
          </Suspense>
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
