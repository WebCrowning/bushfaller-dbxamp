import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        disallow: [
          "/admin",
          "/admin-login",
          "/api",
          "/auth",
          "/dashboard",
          "/signin",
          "/cart",
          "/checkout",
          "/orders",
          "/chat",
          "/notifications",
          "/*.json$",
        ],
      },
      {
        userAgent: ["MJ12bot", "AhrefsBot", "SemrushBot"],
        crawlDelay: 10,
      },
    ],
    sitemap: [
      "https://bushbuyer.com/sitemap.xml",
      "https://bushbuyer.com/sitemap-categories/route.xml",
      "https://bushbuyer.com/sitemap-products/route.xml",
    ],
  };
}
