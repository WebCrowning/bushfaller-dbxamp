import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";
import { isAdminEmail } from "@/lib/authz";

interface User {
  id: number;
  name: string;
  email: string;
  role: string;
  is_blocked: number;
  blocked_reason: string | null;
  created_at: string;
}

export async function GET(request: Request) {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const sessionRole = (session.user as { role?: string }).role;

    // Check if user is admin from session or email config
    const isAdmin = sessionRole === "admin" || isAdminEmail(session.user.email);
    
    if (!isAdmin) {
      return NextResponse.json(
        { error: "Forbidden" },
        { status: 403 },
      );
    }

    const { searchParams } = new URL(request.url);
    const page = parseInt(searchParams.get("page") || "1", 10);
    const limit = parseInt(searchParams.get("limit") || "20", 10);
    const role = searchParams.get("role");
    const blocked = searchParams.get("blocked");

    const offset = (page - 1) * limit;
    let whereClause = "WHERE role = 'user'";
    const params: unknown[] = [];

    if (blocked === "true") {
      whereClause += " AND is_blocked = 1";
    } else if (blocked === "false") {
      whereClause += " AND is_blocked = 0";
    }

    if (role) {
      whereClause += " AND role = ?";
      params.push(role);
    }

    // Get total count
    const countResult = await query<Array<{ count: number }>>(
      `SELECT COUNT(*) as count FROM users ${whereClause}`,
      params,
    );

    const total = countResult[0]?.count || 0;

    // Get paginated users
    const users = await query<User[]>(
      `SELECT id, name, email, role, is_blocked, blocked_reason, created_at 
       FROM users 
       ${whereClause}
       ORDER BY created_at DESC
       LIMIT ? OFFSET ?`,
      [...params, limit, offset],
    );

    return NextResponse.json({
      users,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
      },
    });
  } catch (err) {
    console.error("Error getting users:", err);
    return NextResponse.json(
      { error: "Failed to get users" },
      { status: 500 },
    );
  }
}
