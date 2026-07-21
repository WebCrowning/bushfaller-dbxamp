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
 * Sitemap: https://bushfaller.com/sitemap.xml
 * Sitemap: https://bushfaller.com/sitemap-categories.xml
 * Sitemap: https://bushfaller.com/sitemap-products.xml
 */
