import NextAuth from "next-auth";
import Credentials from "next-auth/providers/credentials";
import Facebook from "next-auth/providers/facebook";
import Google from "next-auth/providers/google";
import { createHash, timingSafeEqual } from "crypto";
import { query } from "@/lib/db";

type DbUser = {
  id: number;
};

type AuthUserWithRole = {
  id?: string;
  role?: string;
};

const isProduction = process.env.NODE_ENV === "production";
const authSecret = process.env.NEXTAUTH_SECRET ?? "";
const adminEmail = (process.env.ADMIN_LOGIN_EMAIL ?? "").trim().toLowerCase();
const adminPasswordHash = (process.env.ADMIN_LOGIN_PASSWORD_HASH ?? "").trim();
const enableSocialAuth = (process.env.ENABLE_SOCIAL_LOGIN ?? "false").toLowerCase() === "true";

function comparePasswordHash(password: string, storedHash: string) {
  const incomingHash = createHash("sha256").update(password).digest("hex");
  const a = Buffer.from(incomingHash);
  const b = Buffer.from(storedHash);

  if (a.length !== b.length) {
    return false;
  }

  try {
    return timingSafeEqual(a, b);
  } catch {
    return false;
  }
}

const providers = [
  Credentials({
    name: "Email & Password",
    credentials: {
      email: { label: "Email", type: "email" },
      password: { label: "Password", type: "password" },
    },
    async authorize(credentials) {
      const email = String(credentials?.email ?? "").trim().toLowerCase();
      const password = String(credentials?.password ?? "");

      if (!email || !password || !adminEmail || !adminPasswordHash) {
        return null;
      }

      if (email !== adminEmail) {
        return null;
      }

      try {
        if (comparePasswordHash(password, adminPasswordHash)) {
          return {
            id: email,
            name: "Admin",
            email,
            image: null,
            role: "admin",
          };
        }

        return null;
      } catch (error) {
        console.error("Auth authorize error:", error);
        return null;
      }
    },
  }),
];

if (enableSocialAuth) {
  if (process.env.GOOGLE_CLIENT_ID && process.env.GOOGLE_CLIENT_SECRET) {
    providers.push(
      Google({
        clientId: process.env.GOOGLE_CLIENT_ID,
        clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      }),
    );
  }

  if (process.env.FACEBOOK_CLIENT_ID && process.env.FACEBOOK_CLIENT_SECRET) {
    providers.push(
      Facebook({
        clientId: process.env.FACEBOOK_CLIENT_ID,
        clientSecret: process.env.FACEBOOK_CLIENT_SECRET,
      }),
    );
  }
}

if (isProduction && !authSecret) {
  throw new Error("NEXTAUTH_SECRET must be set in production");
}

export const { handlers, auth, signIn, signOut } = NextAuth({
  secret: authSecret || undefined,
  trustHost: true,
  session: {
    strategy: "jwt",
    maxAge: 60 * 60 * 8,
  },
  jwt: {
    maxAge: 60 * 60 * 8,
  },
  providers,
  callbacks: {
    async signIn({ user, account }) {
      try {
        if (!user.email || !account?.provider) {
          return false;
        }

        if (account.provider === "credentials") {
          return true;
        }

        await query(
          `
          INSERT INTO users (name, email, image, provider)
          VALUES (?, ?, ?, ?)
          ON DUPLICATE KEY UPDATE
            name = VALUES(name),
            image = VALUES(image),
            provider = VALUES(provider)
          `,
          [user.name ?? "Customer", user.email, user.image ?? null, account.provider],
        );

        return true;
      } catch (error) {
        console.error("SignIn callback error:", error);
        return true;
      }
    },
    async jwt({ token, user }) {
      try {
        const allowedEmail = (process.env.ADMIN_LOGIN_EMAIL ?? "").trim().toLowerCase();

        // On initial login, add user data to token
        if (user) {
          const authUser = user as AuthUserWithRole;
          token.id = authUser.id ?? token.id;
          token.role = authUser.role || (token.email === allowedEmail ? "admin" : "user");
          return token;
        }

        if (!token.email) {
          return token;
        }

        if (token.id) {
          token.role = token.role ?? (token.email === allowedEmail ? "admin" : "user");
          return token;
        }

        // Fetch user id only to avoid schema-dependent failures.
        const rows = await query<DbUser[]>("SELECT id FROM users WHERE email = ? LIMIT 1", [token.email]);

        if (rows[0]) {
          token.id = String(rows[0].id);
        }

        token.role = token.role ?? (token.email === allowedEmail ? "admin" : "user");

        return token;
      } catch (error) {
        console.error("JWT callback error:", error);
        return token;
      }
    },
    async session({ session, token }) {
      try {
        if (session.user) {
          // Use token.id which is set in JWT callback
          if (token.id) {
            session.user.id = token.id as string;
          }
          // Add role to session
          (session.user as { role?: string }).role = String(token.role || "user");
        }
        return session;
      } catch (error) {
        console.error("Session callback error:", error);
        return session;
      }
    },
  },
  pages: {
    signIn: "/signin",
  },
});
