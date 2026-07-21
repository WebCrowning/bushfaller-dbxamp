import Link from "next/link";
import { redirect } from "next/navigation";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";
import { UserProfileSettingsForm } from "@/components/user-profile-settings-form";
import { requireUserPage } from "@/lib/authz";

export default async function DashboardProfilePage() {
  const session = await requireUserPage();
  const role = (session.user as { role?: string } | undefined)?.role;

  if (role === "admin" || role === "sub_admin") {
    redirect("/admin");
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-brand/5 to-transparent">
      <SiteHeader />
      <main className="container-shell py-12">
        <div className="mb-6">
          <Link href="/dashboard" className="text-sm font-semibold text-brand transition-colors hover:text-brand-deep">
            ← Back to Dashboard
          </Link>
        </div>

        <UserProfileSettingsForm />
      </main>
      <SiteFooter />
    </div>
  );
}
