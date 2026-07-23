import Image from "next/image";
import Link from "next/link";

export function SiteFooter() {
  const socialLinks = [
    {
      name: "facebook",
      href: "https://facebook.com",
      icon: "/images/facebook.png",
      label: "Facebook",
    },
    {
      name: "instagram",
      href: "https://instagram.com",
      icon: "/images/instagram.png",
      label: "Instagram",
    },
    {
      name: "twitter",
      href: "https://twitter.com",
      icon: "/images/twitter.png",
      label: "Twitter",
    },
    {
      name: "youtube",
      href: "https://youtube.com",
      icon: "/images/youtube.png",
      label: "YouTube",
    },
  ];

  return (
    <footer className="mt-20 bg-black text-white">
      <div className="container-shell grid gap-8 py-10 md:grid-cols-3">
        <div className="text-center md:text-left">
          <h3 className="text-lg font-bold text-white">Bushbuyer</h3>
          <p className="mt-3 text-sm leading-6 text-white/80">
            Trusted African raw food marketplace delivering premium ingredients to homes and restaurants worldwide.
          </p>
          <div className="mt-4 flex items-center justify-center md:justify-start gap-3">
            {socialLinks.map((link) => (
              <a
                key={link.name}
                href={link.href}
                target="_blank"
                rel="noreferrer"
                aria-label={`Contact Bushbuyer on ${link.label}`}
                className="transition-opacity hover:opacity-80"
              >
                <Image
                  src={link.icon}
                  alt={link.label}
                  width={24}
                  height={24}
                  className="h-6 w-6"
                />
              </a>
            ))}
          </div>
        </div>

        <div className="text-center md:text-left">
          <h4 className="text-sm font-bold uppercase tracking-wide text-white">Quick Links</h4>
          <div className="mt-3 flex flex-col gap-2 text-sm text-white/80">
            <Link href="/products" className="hover:text-white transition-colors">All Products</Link>
            <Link href="/orders" className="hover:text-white transition-colors">Track Orders</Link>
            <Link href="/faq" className="hover:text-white transition-colors">FAQ</Link>
            <Link href="/contact" className="hover:text-white transition-colors">Send Message</Link>
            <Link href="/about" className="hover:text-white transition-colors">About Us</Link>
            <Link href="/privacy" className="hover:text-white transition-colors">Privacy Policy</Link>
          </div>
        </div>

        <div className="text-center md:text-left">
          <h4 className="text-sm font-bold uppercase tracking-wide text-white">Support</h4>
          <p className="mt-3 text-sm text-white/80">support@bushbuyer.com</p>
          <p className="text-sm text-white/80">+237 676 06 85 33</p>
        </div>
      </div>
      <div className="border-t border-white/10 py-4 text-center text-xs text-white/60">
        Copyright {new Date().getFullYear()} Bushbuyer. All rights reserved.
      </div>
    </footer>
  );
}
