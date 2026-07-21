"use client";

import Image from "next/image";
import { signIn } from "next-auth/react";
import { useSession } from "next-auth/react";
import { useRouter, useSearchParams } from "next/navigation";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";
import { FormEvent, useState, useEffect, Suspense } from "react";

function SignInFormContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { data: session, status } = useSession();
  const [email, setEmail] = useState("user1@gmail.com");
  const [password, setPassword] = useState("user1");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [debugInfo, setDebugInfo] = useState<string | null>(null);

  function getUserRole(user: unknown) {
    if (!user || typeof user !== "object") return "user";
    const maybeRole = (user as { role?: unknown }).role;
    const maybeName = (user as { name?: unknown }).name;
    if (maybeRole === "admin") return "admin";
    if (maybeName === "Admin") return "admin";
    return "user";
  }

  // Redirect if already logged in
  useEffect(() => {
    if (status === "authenticated" && session?.user) {
      // Redirect based on user role
      const isAdmin = getUserRole(session.user) === "admin";
      const redirectPath = isAdmin ? "/admin" : "/dashboard";
      router.push(redirectPath);
    }
  }, [status, session, router]);

  useEffect(() => {
    const authError = searchParams.get("error");
    const authCode = searchParams.get("code");
    if (authError || authCode) {
      setError(`Auth error: ${authError ?? "unknown"}${authCode ? ` (code: ${authCode})` : ""}`);
      setDebugInfo(`URL params -> error=${authError ?? ""}, code=${authCode ?? ""}`);
    }
  }, [searchParams]);

  async function handleCredentialsSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setLoading(true);
    setError(null);
    setSuccess(null);
    setDebugInfo(null);
    
    try {
      const result = await signIn("credentials", {
        email,
        password,
        redirect: false,
      });

      setDebugInfo(JSON.stringify(result ?? { message: "No result from signIn" }, null, 2));

      if (result?.ok) {
        setSuccess("Sign in succeeded. Verifying session before redirect...");
        // Wait a moment for session to be established
        await new Promise(resolve => setTimeout(resolve, 500));
        
        // Fetch session to check role
        const response = await fetch("/api/auth/session");
        if (!response.ok) {
          setError(`Session API failed with status ${response.status}`);
          return;
        }
        const sessionData = await response.json();
        
        if (sessionData?.user?.id) {
          // Redirect based on role
          const isAdmin = getUserRole(sessionData.user) === "admin";
          const redirectPath = isAdmin ? "/admin" : "/dashboard";
          setSuccess(`Session OK. Redirecting to ${redirectPath}...`);
          router.push(redirectPath);
        } else {
          setError("Login succeeded but session.user.id is missing, so protected pages redirect to /signin.");
          setDebugInfo(`${JSON.stringify(result ?? {}, null, 2)}\n\nSession:\n${JSON.stringify(sessionData ?? {}, null, 2)}`);
        }
      } else {
        setError(`Login failed: ${result?.error ?? "Invalid email or password"}`);
      }
    } catch (err) {
      console.error("Sign in error:", err);
      setError("An exception occurred during sign-in. Check debug output below.");
      setDebugInfo(String(err));
    } finally {
      setLoading(false);
    }
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
      <p className="section-kicker text-center">Authentication</p>
      <h1 className="mt-3 text-3xl font-bold text-brand-deep text-center">Sign in to Bushfaller</h1>
      <p className="mt-3 text-sm text-foreground/70">
        Continue with your preferred social account to place orders and track deliveries.
      </p>

      {/* Temporary Customer Login */}
      <div className="mt-8 p-4 bg-yellow-50 rounded-lg border border-yellow-200">
        <p className="text-xs font-semibold text-yellow-800 mb-3">🧪 TEST LOGIN (Temporary)</p>
        {success && (
          <div className="mb-3 p-3 bg-green-100 border border-green-300 rounded text-sm text-green-800">
            {success}
          </div>
        )}
        {error && (
          <div className="mb-3 p-3 bg-red-100 border border-red-300 rounded text-sm text-red-800">
            {error}
          </div>
        )}
        {debugInfo && (
          <pre className="mb-3 max-h-48 overflow-auto rounded border border-yellow-300 bg-yellow-100 p-3 text-xs text-yellow-900">
            {debugInfo}
          </pre>
        )}
        <form onSubmit={handleCredentialsSubmit} className="space-y-3">
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="Email"
            className="w-full px-3 py-2 rounded-lg border border-border text-sm"
          />
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="Password"
            className="w-full px-3 py-2 rounded-lg border border-border text-sm"
          />
          <button
            type="submit"
            disabled={loading}
            className="w-full rounded-lg bg-yellow-600 px-3 py-2 text-sm font-semibold text-white hover:bg-yellow-700 disabled:opacity-50"
          >
            {loading ? "Signing in..." : "Test Login"}
          </button>
        </form>
      </div>

      <div className="mt-8 space-y-3">
        <button
          type="button"
          onClick={() => signIn("google", { callbackUrl: "/" })}
          className="w-full rounded-xl border border-border bg-surface px-4 py-3 text-sm font-semibold transition-colors hover:bg-surface-soft"
        >
          Continue with Google
        </button>
        <button
          type="button"
          onClick={() => signIn("facebook", { callbackUrl: "/" })}
          className="w-full rounded-xl bg-[#1877F2] px-4 py-3 text-sm font-semibold text-white transition-opacity hover:opacity-90"
        >
          Continue with Facebook
        </button>
      </div>
    </>
  );
}

export default function SignInPage() {
  return (
    <div className="min-h-screen">
      <SiteHeader />
      <main className="container-shell py-16">
        <div className="glass-card mx-auto max-w-lg rounded-3xl p-8">
          <Suspense fallback={<div className="flex justify-center py-8">Loading...</div>}>
            <SignInFormContent />
          </Suspense>
        </div>
      </main>
      <SiteFooter />
    </div>
  );
}
