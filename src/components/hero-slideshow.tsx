"use client";

import { useEffect, useMemo, useState } from "react";
import { ChevronLeft, ChevronRight } from "lucide-react";

type HeroSlideshowProps = {
  images: string[];
};

const fallbackImages = [
  "/images/logo.png",
  "/images/facebook.png",
  "/images/instagram.png",
];

export function HeroSlideshow({ images }: HeroSlideshowProps) {
  const slides = useMemo(() => {
    const valid = images.filter(Boolean);
    return valid.length > 0 ? valid : fallbackImages;
  }, [images]);

  const [index, setIndex] = useState(0);

  useEffect(() => {
    setIndex(0);
  }, [slides.length]);

  useEffect(() => {
    if (slides.length <= 1) return;

    const timer = setInterval(() => {
      setIndex((prev) => (prev + 1) % slides.length);
    }, 3500);

    return () => clearInterval(timer);
  }, [slides.length]);

  const goTo = (nextIndex: number) => {
    setIndex((nextIndex + slides.length) % slides.length);
  };

  return (
    <div className="relative w-full overflow-hidden rounded-3xl border border-white/40 bg-white/70 shadow-2xl backdrop-blur-sm">
      <div className="relative aspect-[16/9] w-full">
        {slides.map((src, i) => (
          <img
            key={`${src}-${i}`}
            src={src}
            alt={`Company showcase ${i + 1}`}
            className={`absolute inset-0 h-full w-full object-cover transition-opacity duration-700 ${
              i === index ? "opacity-100" : "opacity-0"
            }`}
          />
        ))}
      </div>

      {slides.length > 1 && (
        <>
          <button
            type="button"
            onClick={() => goTo(index - 1)}
            className="absolute left-3 top-1/2 -translate-y-1/2 rounded-full border border-white/60 bg-black/35 p-2 text-white transition-colors hover:bg-black/55"
            aria-label="Previous slide"
          >
            <ChevronLeft size={18} />
          </button>

          <button
            type="button"
            onClick={() => goTo(index + 1)}
            className="absolute right-3 top-1/2 -translate-y-1/2 rounded-full border border-white/60 bg-black/35 p-2 text-white transition-colors hover:bg-black/55"
            aria-label="Next slide"
          >
            <ChevronRight size={18} />
          </button>

          <div className="absolute bottom-3 left-1/2 flex -translate-x-1/2 items-center gap-2 rounded-full bg-black/35 px-3 py-1.5">
            {slides.map((_, i) => (
              <button
                key={`dot-${i}`}
                type="button"
                onClick={() => goTo(i)}
                className={`h-2.5 w-2.5 rounded-full transition-colors ${
                  i === index ? "bg-white" : "bg-white/50"
                }`}
                aria-label={`Go to slide ${i + 1}`}
              />
            ))}
          </div>
        </>
      )}
    </div>
  );
}
