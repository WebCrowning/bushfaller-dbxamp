import { NextResponse } from "next/server";
import { auth } from "@/auth";
import { query } from "@/lib/db";

interface SubAdmin {
  id: number;
  name: string;
  email: string;
  role: string;
  created_at: string;
}

interface ErrorResponse {
  error: string;
}

interface SuccessResponse {
  message: string;
  data?: SubAdmin;
}

export async function GET() {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Get current user's role
    const currentUser = await query<Array<{ role: string }>>(
      "SELECT role FROM users WHERE email = ?",
      [session.user.email],
    );

    if (!currentUser.length || currentUser[0].role !== "admin") {
      return NextResponse.json(
        { error: "Only admins can view sub-admins" },
        { status: 403 },
      );
    }

    // Get all sub-admins
    const subAdmins = await query<SubAdmin[]>(
      "SELECT id, name, email, role, created_at FROM users WHERE role = 'sub_admin' ORDER BY created_at DESC",
    );

    return NextResponse.json({ subAdmins });
  } catch (err) {
    console.error("Error getting sub-admins:", err);
    return NextResponse.json(
      { error: "Failed to get sub-admins" },
      { status: 500 },
    );
  }
}

export async function POST(request: Request) {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const body = await request.json().catch(() => null);
    if (!body?.email) {
      return NextResponse.json(
        { error: "Email is required" },
        { status: 400 },
      );
    }

    // Get current user's role
    const currentUser = await query<Array<{ role: string; id: number }>>(
      "SELECT id, role FROM users WHERE email = ?",
      [session.user.email],
    );

    if (!currentUser.length || currentUser[0].role !== "admin") {
      return NextResponse.json(
        { error: "Only admins can add sub-admins" },
        { status: 403 },
      );
    }

    const adminId = currentUser[0].id;

    // Check if user exists
    const existingUser = await query<Array<{ id: number; role: string }>>(
      "SELECT id, role FROM users WHERE email = ?",
      [body.email],
    );

    if (!existingUser.length) {
      return NextResponse.json(
        { error: "User not found" },
        { status: 404 },
      );
    }

    // Prevent adding another admin as sub-admin
    if (existingUser[0].role === "admin") {
      return NextResponse.json(
        { error: "Cannot promote an admin to sub-admin" },
        { status: 400 },
      );
    }

    // Update user role to sub_admin
    await query(
      "UPDATE users SET role = 'sub_admin' WHERE id = ?",
      [existingUser[0].id],
    );

    const updatedUser = await query<SubAdmin[]>(
      "SELECT id, name, email, role, created_at FROM users WHERE id = ?",
      [existingUser[0].id],
    );

    return NextResponse.json({
      message: "Sub-admin added successfully",
      data: updatedUser[0],
    });
  } catch (err) {
    console.error("Error adding sub-admin:", err);
    return NextResponse.json(
      { error: "Failed to add sub-admin" },
      { status: 500 },
    );
  }
}

export async function DELETE(request: Request) {
  try {
    const session = await auth();
    if (!session?.user?.email) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const { searchParams } = new URL(request.url);
    const userId = searchParams.get("id");

    if (!userId) {
      return NextResponse.json(
        { error: "User ID is required" },
        { status: 400 },
      );
    }

    // Get current user's role
    const currentUser = await query<Array<{ role: string }>>(
      "SELECT role FROM users WHERE email = ?",
      [session.user.email],
    );

    if (!currentUser.length || currentUser[0].role !== "admin") {
      return NextResponse.json(
        { error: "Only admins can remove sub-admins" },
        { status: 403 },
      );
    }

    // Remove sub-admin status (revert to user)
    await query(
      "UPDATE users SET role = 'user' WHERE id = ? AND role = 'sub_admin'",
      [userId],
    );

    return NextResponse.json({ message: "Sub-admin removed successfully" });
  } catch (err) {
    console.error("Error removing sub-admin:", err);
    return NextResponse.json(
      { error: "Failed to remove sub-admin" },
      { status: 500 },
    );
  }
}
