import Link from "next/link";
import { AdminMessageCleanupManager } from "@/components/admin-message-cleanup-manager";

export default function AdminMessagesManagePage() {
  return (
    <div className="space-y-4">
      <div>
        <Link href="/admin/messages" className="text-sm font-semibold text-brand transition-colors hover:text-brand-deep">
          ← Back to Customer Messages
        </Link>
      </div>
      <AdminMessageCleanupManager />
    </div>
  );
}
