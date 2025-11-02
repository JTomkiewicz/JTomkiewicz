# Multi-Stage Docker Build Example

Production-ready Docker configuration for a Node.js application demonstrating best practices.

## Features

✅ Multi-stage build for minimal image size  
✅ Security hardening (non-root user, minimal base image)  
✅ Layer caching optimization  
✅ Health checks  
✅ .dockerignore for efficient builds  
✅ Docker Compose for local development  
✅ Build arguments and environment variables  

## Files

- `Dockerfile` - Production multi-stage build
- `Dockerfile.dev` - Development configuration with hot reload
- `docker-compose.yml` - Local development environment
- `.dockerignore` - Exclude unnecessary files from build context

## Build and Run

### Production Build

```bash
# Build the image
docker build -t demo-app:latest .

# Run the container
docker run -d \
  --name demo-app \
  -p 3000:3000 \
  -e NODE_ENV=production \
  demo-app:latest

# Check logs
docker logs demo-app

# Stop and remove
docker stop demo-app && docker rm demo-app
```

### Development with Docker Compose

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f app

# Rebuild after changes
docker-compose up -d --build

# Stop all services
docker-compose down
```

## Build Arguments

```bash
docker build \
  --build-arg NODE_VERSION=20 \
  --build-arg PORT=3000 \
  -t demo-app:latest .
```

## Security Best Practices

1. **Non-root user**: Application runs as non-privileged user
2. **Minimal base image**: Using Alpine Linux for smaller attack surface
3. **Multi-stage build**: Only production dependencies in final image
4. **No secrets in image**: Use environment variables or secret management
5. **Vulnerability scanning**: Scan images with tools like Trivy

## Image Size Optimization

- Multi-stage build separates build and runtime dependencies
- Alpine base image (~5MB vs ~100MB for standard images)
- Only production node_modules in final image
- Proper layer caching with strategic COPY commands

## Health Checks

The Dockerfile includes a health check that:
- Runs every 30 seconds
- Times out after 3 seconds
- Retries 3 times before marking unhealthy
- Uses HTTP GET to /health endpoint
