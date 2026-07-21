"use client";

import { useEffect, useState } from "react";

type Profile = {
  id: number;
  name: string;
  email: string;
  createdAt: string;
  phoneCountryCode: string;
  phoneNumber: string;
  country: string;
  addressLine1: string;
  addressLine2: string;
  city: string;
  stateProvince: string;
  postalCode: string;
  deliveryNote: string;
};

export function UserProfileSettingsForm() {
  const [profile, setProfile] = useState<Profile | null>(null);
  const [name, setName] = useState("");
  const [phoneCountryCode, setPhoneCountryCode] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [country, setCountry] = useState("");
  const [addressLine1, setAddressLine1] = useState("");
  const [addressLine2, setAddressLine2] = useState("");
  const [city, setCity] = useState("");
  const [stateProvince, setStateProvince] = useState("");
  const [postalCode, setPostalCode] = useState("");
  const [deliveryNote, setDeliveryNote] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState<string>("");

  async function loadProfile() {
    setLoading(true);
    setMessage("");

    try {
      const response = await fetch("/api/user/profile", { cache: "no-store" });
      const payload = (await response.json().catch(() => null)) as
        | { profile?: Profile; error?: string }
        | null;

      if (!response.ok || !payload?.profile) {
        setMessage(payload?.error || "Failed to load profile");
        return;
      }

      setProfile(payload.profile);
      setName(payload.profile.name);
      setPhoneCountryCode(payload.profile.phoneCountryCode ?? "");
      setPhoneNumber(payload.profile.phoneNumber ?? "");
      setCountry(payload.profile.country ?? "");
      setAddressLine1(payload.profile.addressLine1 ?? "");
      setAddressLine2(payload.profile.addressLine2 ?? "");
      setCity(payload.profile.city ?? "");
      setStateProvince(payload.profile.stateProvince ?? "");
      setPostalCode(payload.profile.postalCode ?? "");
      setDeliveryNote(payload.profile.deliveryNote ?? "");
    } catch {
      setMessage("Failed to load profile");
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    void loadProfile();
  }, []);

  async function saveProfile() {
    setSaving(true);
    setMessage("");

    try {
      const response = await fetch("/api/user/profile", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          name,
          phoneCountryCode,
          phoneNumber,
          country,
          addressLine1,
          addressLine2,
          city,
          stateProvince,
          postalCode,
          deliveryNote,
        }),
      });

      const payload = (await response.json().catch(() => null)) as
        | { ok?: boolean; error?: string }
        | null;

      if (!response.ok || !payload?.ok) {
        setMessage(payload?.error || "Failed to update profile");
        return;
      }

      setProfile((prev) =>
        prev
          ? {
              ...prev,
              name,
              phoneCountryCode,
              phoneNumber,
              country,
              addressLine1,
              addressLine2,
              city,
              stateProvince,
              postalCode,
              deliveryNote,
            }
          : prev,
      );
      setMessage("Profile updated successfully.");
    } catch {
      setMessage("Failed to update profile");
    } finally {
      setSaving(false);
    }
  }

  return (
    <div className="rounded-2xl border border-border/50 bg-white p-6 shadow-sm md:p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-brand-deep">Profile Settings</h1>
        <p className="mt-1 text-sm text-foreground/65">Update your account profile details.</p>
      </div>

      {loading ? (
        <p className="text-sm text-foreground/60">Loading profile...</p>
      ) : (
        <div className="space-y-4">
          <label className="block text-sm font-semibold text-foreground/75">
            Full Name
            <input
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="mt-1 w-full rounded-xl border border-border bg-surface px-4 py-3 text-sm"
              placeholder="Enter your full name"
            />
          </label>

          <div className="rounded-xl border border-border/50 bg-surface-soft/50 p-4">
            <h2 className="text-sm font-bold uppercase tracking-wide text-foreground/60">Default Shipping Information</h2>
            <p className="mt-1 text-xs text-foreground/60">
              These details auto-fill checkout to speed up international shipping.
            </p>

            <div className="mt-3 grid gap-3 md:grid-cols-2">
              <div className="md:col-span-2">
                <p className="text-sm font-semibold text-foreground/75">Phone</p>
                <div className="mt-1 grid grid-cols-[112px_1fr] gap-2">
                  <input
                    value={phoneCountryCode}
                    onChange={(e) => setPhoneCountryCode(e.target.value)}
                    className="w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                    placeholder="+237"
                  />
                  <input
                    value={phoneNumber}
                    onChange={(e) => setPhoneNumber(e.target.value)}
                    className="w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                    placeholder="677123456"
                  />
                </div>
              </div>

              <label className="block text-sm font-semibold text-foreground/75 md:col-span-2">
                Country
                <input
                  value={country}
                  onChange={(e) => setCountry(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                  placeholder="Country"
                />
              </label>

              <label className="block text-sm font-semibold text-foreground/75 md:col-span-2">
                Address Line 1
                <input
                  value={addressLine1}
                  onChange={(e) => setAddressLine1(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                  placeholder="House number and street"
                />
              </label>

              <label className="block text-sm font-semibold text-foreground/75 md:col-span-2">
                Address Line 2 (optional)
                <input
                  value={addressLine2}
                  onChange={(e) => setAddressLine2(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                  placeholder="Apartment, suite, building"
                />
              </label>

              <label className="block text-sm font-semibold text-foreground/75">
                City
                <input
                  value={city}
                  onChange={(e) => setCity(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                  placeholder="City"
                />
              </label>

              <label className="block text-sm font-semibold text-foreground/75">
                State / Province / Region
                <input
                  value={stateProvince}
                  onChange={(e) => setStateProvince(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                  placeholder="State, province, or region"
                />
              </label>

              <label className="block text-sm font-semibold text-foreground/75">
                Postal / ZIP Code
                <input
                  value={postalCode}
                  onChange={(e) => setPostalCode(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                  placeholder="Postal code"
                />
              </label>

              <label className="block text-sm font-semibold text-foreground/75 md:col-span-2">
                Delivery Note (optional)
                <textarea
                  value={deliveryNote}
                  onChange={(e) => setDeliveryNote(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-border bg-white px-4 py-3 text-sm"
                  placeholder="Landmark or delivery instructions"
                  rows={3}
                />
              </label>
            </div>
          </div>

          <label className="block text-sm font-semibold text-foreground/75">
            Email Address
            <input
              value={profile?.email ?? ""}
              readOnly
              className="mt-1 w-full rounded-xl border border-border bg-surface-soft px-4 py-3 text-sm text-foreground/70"
            />
          </label>

          <label className="block text-sm font-semibold text-foreground/75">
            Member Since
            <input
              value={profile?.createdAt ? new Date(profile.createdAt).toLocaleDateString() : "-"}
              readOnly
              className="mt-1 w-full rounded-xl border border-border bg-surface-soft px-4 py-3 text-sm text-foreground/70"
            />
          </label>

          <div className="pt-2">
            <button
              type="button"
              onClick={() => void saveProfile()}
              disabled={saving}
              className="rounded-full bg-brand px-5 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-brand-deep disabled:opacity-60"
            >
              {saving ? "Saving..." : "Save Profile"}
            </button>
          </div>

          {message ? (
            <p className={`text-sm font-semibold ${message.includes("success") ? "text-emerald-600" : "text-red-600"}`}>
              {message}
            </p>
          ) : null}
        </div>
      )}
    </div>
  );
}
