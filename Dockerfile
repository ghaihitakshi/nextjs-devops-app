# =========================
# 1️⃣ Build Stage
# =========================
FROM node:20-alpine AS builder

# Set working directory inside container
WORKDIR /app

# Copy only package files first (for Docker caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the Next.js app for production
RUN npm run build


# =========================
# 2️⃣ Runtime Stage
# =========================
FROM node:20-alpine AS runner

# Set environment variable for production
ENV NODE_ENV=production

WORKDIR /app

# Copy only required files from builder
COPY --from=builder /app/package.json ./
COPY --from=builder /app/package-lock.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

# Expose Next.js default port
EXPOSE 3000

# Start the production server
CMD ["npm", "start"]
