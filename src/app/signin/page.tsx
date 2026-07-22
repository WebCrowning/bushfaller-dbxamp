"use client";

import Image from "next/image";
import Link from "next/link";
import { signIn, useSession } from "next-auth/react";
import { useRouter, useSearchParams } from "next/navigation";
import { useState, useEffect, Suspense } from "react";
import { ShieldCheck, AlertCircle, Sparkles } from "lucide-react";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";

function SignInFormContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { data: session, status } = useSession();
  const [error, setError] = useState<string | null>(null);

  function getUserRole(user: unknown) {
    if (!user || typeof user !== "object") return "user";
    const maybeRole = (user as { role?: unknown }).role;
    const maybeName = (user as { name?: unknown }).name;
    if (maybeRole === "admin" || maybeRole === "sub_admin") return "admin";
    if (maybeName === "Admin") return "admin";
    return "user";
  }

  // Redirect if already logged in
  useEffect(() => {
    if (status === "authenticated" && session?.user) {
      const isAdmin = getUserRole(session.user) === "admin";
      const redirectPath = isAdmin ? "/admin" : "/dashboard";
      router.push(redirectPath);
    }
  }, [status, session, router]);

  useEffect(() => {
    const authError = searchParams.get("error");
    if (authError) {
      if (authError === "OAuthSignin" || authError === "OAuthCallback") {
        setError("Unable to complete social sign-in. Please try again or check your account.");
      } else {
        setError("Authentication error. Please try signing in again.");
      }
    }
  }, [searchParams]);

  return (
    <div className="w-full">
      {/* Header & Logo */}
      <div className="flex flex-col items-center text-center">
        <div className="relative mb-4 flex items-center justify-center">
          <div className="absolute -inset-1.5 rounded-full bg-gradient-to-r from-emerald-500 to-brand opacity-25 blur-sm"></div>
          <Image
            src="/images/logo.png"
            alt="Bushbuyer logo"
            width={96}
            height={96}
            className="relative h-24 w-24 rounded-full object-cover shadow-md"
            priority
          />
        </div>

        <div className="inline-flex items-center gap-1.5 rounded-full bg-emerald-100/80 px-3.5 py-1 text-xs font-semibold text-emerald-800 dark:bg-emerald-950/40 dark:text-emerald-300">
          <Sparkles className="h-3.5 w-3.5 text-emerald-600" />
          <span>Customer Account</span>
        </div>

        <h1 className="mt-3 text-2xl font-extrabold tracking-tight text-foreground sm:text-3xl">
          Welcome to Bushbuyer
        </h1>
        <p className="mt-2 text-sm text-foreground/70 max-w-sm">
          Sign in to place orders, track live deliveries, and manage your saved profile.
        </p>
      </div>

      {/* Error Alert */}
      {error && (
        <div className="mt-6 flex items-start gap-3 rounded-2xl border border-red-200 bg-red-50 p-4 text-sm text-red-800 dark:border-red-900/50 dark:bg-red-950/40 dark:text-red-300">
          <AlertCircle className="mt-0.5 h-5 w-5 shrink-0 text-red-600 dark:text-red-400" />
          <p className="text-sm font-medium">{error}</p>
        </div>
      )}

      {/* Social Provider Login Buttons */}
      <div className="mt-8 space-y-3.5">
        {/* Google Sign In Button */}
        <button
          type="button"
          onClick={() => signIn("google", { callbackUrl: "/" })}
          className="group relative flex w-full items-center justify-center gap-3 rounded-2xl border border-slate-200 bg-white px-4 py-3.5 text-sm font-semibold text-slate-700 shadow-sm transition-all duration-200 hover:border-slate-300 hover:bg-slate-50/80 hover:shadow-md active:scale-[0.99] dark:border-slate-800 dark:bg-slate-900 dark:text-slate-200 dark:hover:bg-slate-800/80 cursor-pointer"
        >
          <svg className="h-5 w-5 shrink-0 transition-transform duration-200 group-hover:scale-110" viewBox="0 0 24 24">
            <path
              fill="#4285F4"
              d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
            />
            <path
              fill="#34A853"
              d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
            />
            <path
              fill="#FBBC05"
              d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z"
            />
            <path
              fill="#EA4335"
              d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z"
            />
          </svg>
          <span>Continue with Google</span>
        </button>

        {/* Facebook Sign In Button */}
        <button
          type="button"
          onClick={() => signIn("facebook", { callbackUrl: "/" })}
          className="group relative flex w-full items-center justify-center gap-3 rounded-2xl bg-[#1877F2] px-4 py-3.5 text-sm font-semibold text-white shadow-sm transition-all duration-200 hover:bg-[#166FE5] hover:shadow-md active:scale-[0.99] cursor-pointer"
        >
          <svg className="h-5 w-5 shrink-0 fill-current transition-transform duration-200 group-hover:scale-110" viewBox="0 0 24 24">
            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
          </svg>
          <span>Continue with Facebook</span>
        </button>
      </div>

      {/* Security Guarantee & Terms */}
      <div className="mt-8 pt-6 border-t border-border/60 text-center space-y-2">
        <div className="inline-flex items-center gap-1 text-xs text-foreground/60">
          <ShieldCheck className="h-3.5 w-3.5 text-emerald-600" />
          <span>Secure SSL Encrypted Connection</span>
        </div>
        <p className="text-xs text-foreground/50 max-w-xs mx-auto leading-relaxed">
          By continuing, you agree to Bushbuyer&apos;s{" "}
          <Link href="/privacy" className="underline hover:text-foreground">
            Privacy Policy
          </Link>{" "}
          and Terms of Service.
        </p>
      </div>
    </div>
  );
}

export default function SignInPage() {
  return (
    <div className="flex min-h-screen flex-col bg-background">
      <SiteHeader />
      <main className="flex-1 container-shell py-12 md:py-20 flex items-center justify-center">
        <div className="glass-card w-full max-w-md rounded-3xl p-6 sm:p-8 shadow-xl border border-border/80 bg-surface/90 backdrop-blur-md">
          <Suspense fallback={<div className="flex justify-center py-12 text-sm text-foreground/60">Loading...</div>}>
            <SignInFormContent />
          </Suspense>
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
