import type { MetadataRoute } from "next";

/**
 * Sitemap Index
 * Lists all available sitemaps for search engines
 * This helps organize large sites with multiple sitemaps
 */
export default function sitemapIndex(): MetadataRoute.Sitemap {
  // This file doesn't exist yet, but we can register the main sitemaps here
  return [];
}

/**
 * To use the sitemap index, add this to your robots.txt:
 * 
 * Sitemap: https://bushbuyer.com/sitemap.xml
 * Sitemap: https://bushbuyer.com/sitemap-categories.xml
 * Sitemap: https://bushbuyer.com/sitemap-products.xml
 */
