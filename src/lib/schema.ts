// JSON-LD Schema generators for SEO
// These functions return structured data objects that can be embedded in pages

export function organizationSchema() {
  return {
    "@context": "https://schema.org",
    "@type": "Organization",
    name: "Bushbuyer",
    url: "https://bushbuyer.com",
    logo: "https://bushbuyer.com/images/logo.png",
    description:
      "Premium African raw food ingredients marketplace connecting families and businesses with authentic sourced products.",
    sameAs: [
      "https://facebook.com/Bushbuyer",
      "https://twitter.com/Bushbuyer",
      "https://instagram.com/Bushbuyer",
    ],
    contactPoint: {
      "@type": "ContactPoint",
      contactType: "Customer Service",
      email: "support@bushbuyer.com",
      availableLanguage: ["en"],
    },
    address: {
      "@type": "PostalAddress",
      addressCountry: "Global",
      addressLocality: "International",
    },
  };
}

export function localBusinessSchema() {
  return {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    name: "Bushbuyer",
    description:
      "Premium African raw food ingredients marketplace with worldwide delivery.",
    url: "https://bushbuyer.com",
    telephone: "+1-contact-us-for-number",
    email: "support@bushbuyer.com",
    priceRange: "$",
    areaServed: {
      "@type": "Country",
      name: "Global",
    },
  };
}

export function ecommerceSchema() {
  return {
    "@context": "https://schema.org",
    "@type": "WebSite",
    url: "https://bushbuyer.com",
    name: "Bushbuyer",
    description: "Premium African raw food ingredients marketplace",
    potentialAction: {
      "@type": "SearchAction",
      target: {
        "@type": "EntryPoint",
        urlTemplate: "https://bushbuyer.com/products?search={search_term_string}",
      },
      "query-input": "required name=search_term_string",
    },
  };
}

export function productSchema(product: {
  id: number;
  name: string;
  description: string;
  price: number;
  image: string;
  category?: string;
}) {
  return {
    "@context": "https://schema.org",
    "@type": "Product",
    sku: String(product.id),
    name: product.name,
    description: product.description,
    image: product.image,
    category: product.category || "Food",
    offers: {
      "@type": "Offer",
      price: product.price,
      priceCurrency: "USD",
      availability: "https://schema.org/InStock",
      url: `https://bushbuyer.com/products/${product.id}`,
    },
    aggregateRating: {
      "@type": "AggregateRating",
      ratingValue: "4.5",
      ratingCount: "100",
    },
  };
}

export function breadcrumbSchema(breadcrumbs: Array<{ name: string; url: string }>) {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: breadcrumbs.map((item, index) => ({
      "@type": "ListItem",
      position: index + 1,
      name: item.name,
      item: item.url,
    })),
  };
}

export function faqSchema(faqs: Array<{ question: string; answer: string }>) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: faqs.map((faq) => ({
      "@type": "Question",
      name: faq.question,
      acceptedAnswer: {
        "@type": "Answer",
        text: faq.answer,
      },
    })),
  };
}
