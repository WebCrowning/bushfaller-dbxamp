import { query } from "@/lib/db";

type NotificationInput = {
  type?: string;
  title: string;
  body?: string;
  link?: string;
};

export async function createAdminNotification(input: NotificationInput) {
  try {
    await query(
      `INSERT INTO notifications (user_id, audience, type, title, body, link)
       VALUES (NULL, 'admin', ?, ?, ?, ?)`,
      [input.type ?? "general", input.title, input.body ?? null, input.link ?? null],
    );
  } catch (error) {
    console.error("Failed to create admin notification:", error);
  }
}

export async function createUserNotification(userId: number, input: NotificationInput) {
  if (!Number.isInteger(userId) || userId <= 0) {
    return;
  }

  try {
    await query(
      `INSERT INTO notifications (user_id, audience, type, title, body, link)
       VALUES (?, 'user', ?, ?, ?, ?)`,
      [userId, input.type ?? "general", input.title, input.body ?? null, input.link ?? null],
    );
  } catch (error) {
    console.error("Failed to create user notification:", error);
  }
}
