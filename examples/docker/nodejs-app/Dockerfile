# syntax=docker/dockerfile:1

# Build arguments
ARG NODE_VERSION=20
ARG PORT=3000

#
# Stage 1: Dependencies
#
FROM node:${NODE_VERSION}-alpine AS dependencies

# Install build dependencies
RUN apk add --no-cache \
    python3 \
    make \
    g++

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production && \
    npm cache clean --force

#
# Stage 2: Build
#
FROM node:${NODE_VERSION}-alpine AS build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install all dependencies (including dev dependencies)
RUN npm ci

# Copy source code
COPY . .

# Build application (if needed, e.g., TypeScript compilation)
# RUN npm run build

#
# Stage 3: Production
#
FROM node:${NODE_VERSION}-alpine AS production

# Build arguments
ARG PORT

# Install dumb-init for proper signal handling
RUN apk add --no-cache dumb-init

# Create app directory
WORKDIR /app

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Copy production dependencies from dependencies stage
COPY --from=dependencies --chown=nodejs:nodejs /app/node_modules ./node_modules

# Copy application code from build stage
COPY --from=build --chown=nodejs:nodejs /app/package*.json ./
COPY --from=build --chown=nodejs:nodejs /app/src ./src
# COPY --from=build --chown=nodejs:nodejs /app/dist ./dist  # If using TypeScript

# Set environment variables
ENV NODE_ENV=production \
    PORT=${PORT:-3000} \
    USER=nodejs

# Switch to non-root user
USER nodejs

# Expose port
EXPOSE ${PORT}

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD node -e "require('http').get('http://localhost:${PORT}/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Use dumb-init to handle signals properly
ENTRYPOINT ["dumb-init", "--"]

# Start application
CMD ["node", "src/index.js"]
