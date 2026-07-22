"use client";

import { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { HeaderActions } from "@/components/header-actions";
import { ChevronDown, Menu, X } from "lucide-react";

const primaryNavItems = [
  { href: "/", label: "Home" },
  { href: "/products", label: "Products" },
  { href: "/orders", label: "My Orders" },
  { href: "/chat", label: "Support Chat" },
];

const infoNavItems = [
  { href: "/dashboard/profile", label: "Profile Update" },
  { href: "/faq", label: "FAQ" },
  { href: "/contact", label: "Contact" },
  { href: "/about", label: "About" },
];

export function SiteHeader() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <header className="sticky top-0 z-30 border-b border-slate-800/90 bg-slate-950/95 text-white backdrop-blur-md">
      <div className="container-shell flex h-16 items-center justify-between gap-4">
        <Link
          href="/"
          className="flex items-center gap-2 font-bold tracking-tight text-xl text-white"
        >
          <Image
            src="/images/logo.png"
            alt="Bushbuyer logo"
            width={44}
            height={44}
            className="h-11 w-11 rounded-full object-cover"
            priority
          />
          <span className="hidden sm:inline">Bushbuyer</span>
        </Link>

        {/* Desktop Navigation */}
        <nav className="hidden items-center gap-6 text-sm font-semibold text-white md:flex">
          {primaryNavItems.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className="transition-colors hover:text-slate-300"
            >
              {item.label}
            </Link>
          ))}

          <details className="group relative">
            <summary className="list-none cursor-pointer transition-colors hover:text-slate-300">
              <span className="inline-flex items-center gap-1">
                More
                <ChevronDown size={14} className="transition-transform group-open:rotate-180" />
              </span>
            </summary>
            <div className="absolute right-0 top-8 z-40 w-44 rounded-xl border border-slate-700 bg-slate-900 p-2 shadow-xl">
              {infoNavItems.map((item) => (
                <Link
                  key={item.href}
                  href={item.href}
                  className="block rounded-lg px-3 py-2 text-sm font-semibold text-white transition-colors hover:bg-slate-800"
                >
                  {item.label}
                </Link>
              ))}
            </div>
          </details>
        </nav>

        <div className="flex items-center gap-4">
          <HeaderActions />

          {/* Mobile Menu Button */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="md:hidden p-2 hover:bg-slate-800 rounded-lg transition-colors"
            aria-label="Toggle menu"
          >
            {mobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>
      </div>

      {/* Mobile Navigation Dropdown */}
      {mobileMenuOpen && (
        <nav className="border-t border-slate-800/90 bg-slate-900 md:hidden">
          <div className="container-shell flex flex-col items-center gap-2 py-4">
            {primaryNavItems.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className="w-full max-w-sm rounded-lg px-4 py-2 text-center text-sm font-semibold text-white transition-colors hover:bg-slate-800"
                onClick={() => setMobileMenuOpen(false)}
              >
                {item.label}
              </Link>
            ))}

            <details className="group w-full max-w-sm rounded-lg border border-slate-800">
              <summary className="cursor-pointer px-4 py-2 text-center text-sm font-semibold text-white">
                <span className="inline-flex items-center gap-1">
                  More
                  <ChevronDown size={14} className="transition-transform group-open:rotate-180" />
                </span>
              </summary>
              <div className="flex flex-col gap-1 px-2 pb-2">
                {infoNavItems.map((item) => (
                  <Link
                    key={item.href}
                    href={item.href}
                    className="rounded-lg px-3 py-2 text-center text-sm font-semibold text-slate-200 transition-colors hover:bg-slate-800"
                    onClick={() => setMobileMenuOpen(false)}
                  >
                    {item.label}
                  </Link>
                ))}
              </div>
            </details>
          </div>
        </nav>
      )}
    </header>
  );
}
