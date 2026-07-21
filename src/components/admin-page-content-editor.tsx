"use client";

import { useEffect, useMemo, useRef, useState } from "react";

type EditableSlug = "about" | "privacy";

type EditablePage = {
  slug: EditableSlug;
  title: string;
  contentHtml: string;
  updatedAt?: string;
};

const pages: Array<{ slug: EditableSlug; label: string }> = [
  { slug: "about", label: "About Us" },
  { slug: "privacy", label: "Privacy Policy" },
];

const toolbarButtons: Array<{ label: string; command: string; value?: string }> = [
  { label: "H2", command: "formatBlock", value: "<h2>" },
  { label: "H3", command: "formatBlock", value: "<h3>" },
  { label: "Bold", command: "bold" },
  { label: "Italic", command: "italic" },
  { label: "Bullet", command: "insertUnorderedList" },
  { label: "Number", command: "insertOrderedList" },
];

export function AdminPageContentEditor() {
  const [activeSlug, setActiveSlug] = useState<EditableSlug>("about");
  const [title, setTitle] = useState("");
  const [contentHtml, setContentHtml] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [lastSavedAt, setLastSavedAt] = useState<string>("");
  const [message, setMessage] = useState<string>("");
  const editorRef = useRef<HTMLDivElement | null>(null);

  const activeLabel = useMemo(
    () => pages.find((p) => p.slug === activeSlug)?.label ?? "Page",
    [activeSlug],
  );

  async function loadPage(slug: EditableSlug) {
    setLoading(true);
    setMessage("");

    try {
      const response = await fetch(`/api/admin/content/${slug}`, { cache: "no-store" });
      const payload = (await response.json().catch(() => null)) as
        | { page?: EditablePage; error?: string }
        | null;

      if (!response.ok || !payload?.page) {
        setMessage(payload?.error || "Failed to load page content.");
        return;
      }

      setTitle(payload.page.title);
      setContentHtml(payload.page.contentHtml);
      setLastSavedAt(payload.page.updatedAt || "");
      if (editorRef.current) {
        editorRef.current.innerHTML = payload.page.contentHtml;
      }
    } catch {
      setMessage("Failed to load page content.");
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    void loadPage(activeSlug);
  }, [activeSlug]);

  function applyFormat(command: string, value?: string) {
    if (!editorRef.current) return;
    editorRef.current.focus();
    document.execCommand(command, false, value);
    setContentHtml(editorRef.current.innerHTML);
  }

  async function savePage() {
    setSaving(true);
    setMessage("");

    try {
      const response = await fetch(`/api/admin/content/${activeSlug}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ title, contentHtml }),
      });

      const payload = (await response.json().catch(() => null)) as
        | { ok?: boolean; error?: string }
        | null;

      if (!response.ok || !payload?.ok) {
        setMessage(payload?.error || "Failed to save page.");
        return;
      }

      setMessage("Saved successfully.");
      setLastSavedAt(new Date().toISOString());
    } catch {
      setMessage("Failed to save page.");
    } finally {
      setSaving(false);
    }
  }

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-2xl font-bold text-brand-deep">Content Manager</h1>
        <p className="text-sm text-foreground/70">Edit About Us and Privacy Policy with a simple blog-style editor.</p>
      </div>

      <div className="flex flex-wrap gap-2">
        {pages.map((page) => (
          <button
            key={page.slug}
            type="button"
            onClick={() => setActiveSlug(page.slug)}
            className={`rounded-full border px-4 py-2 text-sm font-semibold transition-colors ${
              activeSlug === page.slug
                ? "border-brand bg-brand text-white"
                : "border-border bg-white text-foreground hover:bg-surface-soft"
            }`}
          >
            {page.label}
          </button>
        ))}
      </div>

      <div className="rounded-2xl border border-border bg-white p-4 md:p-5">
        <div className="grid gap-4">
          <label className="text-sm font-semibold text-foreground/80">
            Page Title
            <input
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              className="mt-1 w-full rounded-xl border border-border bg-surface px-3 py-2 text-sm"
              placeholder="Enter page title"
            />
          </label>

          <div className="space-y-2">
            <p className="text-sm font-semibold text-foreground/80">Editor ({activeLabel})</p>
            <div className="flex flex-wrap gap-2 rounded-xl border border-border bg-surface-soft p-2">
              {toolbarButtons.map((button) => (
                <button
                  key={button.label}
                  type="button"
                  onClick={() => applyFormat(button.command, button.value)}
                  className="rounded-lg border border-border bg-white px-2.5 py-1.5 text-xs font-semibold hover:bg-surface"
                >
                  {button.label}
                </button>
              ))}
            </div>

            <div
              ref={editorRef}
              className="min-h-[320px] rounded-xl border border-border bg-white p-4 text-sm leading-7 focus:outline-none"
              contentEditable
              suppressContentEditableWarning
              onInput={(e) => setContentHtml((e.target as HTMLDivElement).innerHTML)}
            />
          </div>

          <div className="flex flex-wrap items-center justify-between gap-3 border-t border-border pt-3">
            <div className="text-xs text-foreground/60">
              {lastSavedAt ? `Last saved: ${new Date(lastSavedAt).toLocaleString()}` : "Not saved yet"}
            </div>
            <button
              type="button"
              onClick={() => void savePage()}
              disabled={loading || saving}
              className="rounded-full bg-brand px-5 py-2 text-sm font-semibold text-white transition-colors hover:bg-brand-deep disabled:opacity-60"
            >
              {saving ? "Saving..." : "Save Changes"}
            </button>
          </div>

          {message ? (
            <p className={`text-sm font-medium ${message.includes("success") ? "text-emerald-600" : "text-red-600"}`}>
              {message}
            </p>
          ) : null}

          {loading ? <p className="text-sm text-foreground/60">Loading editor...</p> : null}
        </div>
      </div>
    </div>
  );
}
