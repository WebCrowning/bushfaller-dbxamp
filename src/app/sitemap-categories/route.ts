import type { MetadataRoute } from "next";
import { query } from "@/lib/db";

interface Category {
  category: string;
}

/**
 * Sitemap for product categories
 * This helps search engines discover category pages
 */
export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const baseUrl = "https://bushfaller.com";

  try {
    // Get all unique categories
    const categories = await query<Category[]>(
      `SELECT DISTINCT category FROM products WHERE category IS NOT NULL AND category != '' ORDER BY category ASC`,
    );

    const categoryPages: MetadataRoute.Sitemap = categories.map((cat) => ({
      url: `${baseUrl}/products?category=${encodeURIComponent(cat.category)}`,
      lastModified: new Date(),
      changeFrequency: "weekly" as const,
      priority: 0.85,
    }));

    return categoryPages;
  } catch (error) {
    console.error("Error generating category sitemap:", error);
    return [];
  }
}
