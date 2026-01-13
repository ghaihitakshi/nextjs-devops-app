/** @type {import('next').NextConfig} */
const nextConfig = {
  // Enables gzip/brotli compression for smaller response sizes
  compress: true,

  // Removes the "X-Powered-By: Next.js" header for minor security hardening
  poweredByHeader: false,

  // Helps catch potential React bugs during development
  reactStrictMode: true,

  // Image optimization configuration (we'll add domains later if needed)
  images: {
    domains: [],
  },
}

export default nextConfig
