# Kubernetes Microservice Deployment

Production-ready Kubernetes manifests for deploying a microservice application with best practices.

## Architecture

This example demonstrates:
- **Deployment**: Multi-replica application deployment with health checks
- **Service**: ClusterIP service for internal communication
- **Ingress**: NGINX Ingress for external access
- **ConfigMap**: Application configuration management
- **Secret**: Sensitive data management
- **HPA**: Horizontal Pod Autoscaler for dynamic scaling
- **NetworkPolicy**: Network segmentation and security
- **ServiceAccount**: RBAC for pod identity

## Features

✅ Production-ready configuration  
✅ Health checks (liveness & readiness probes)  
✅ Resource limits and requests  
✅ Auto-scaling with HPA  
✅ Network policies for security  
✅ ConfigMaps and Secrets management  
✅ RBAC and service accounts  
✅ Ingress with TLS support  

## Prerequisites

- Kubernetes cluster (1.24+)
- kubectl configured
- NGINX Ingress Controller installed
- cert-manager (for TLS certificates)

## Quick Start

```bash
# Create namespace
kubectl create namespace demo-app

# Apply all manifests
kubectl apply -f namespace.yaml
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f serviceaccount.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f hpa.yaml
kubectl apply -f networkpolicy.yaml
kubectl apply -f ingress.yaml

# Check deployment status
kubectl get all -n demo-app

# View logs
kubectl logs -n demo-app -l app=demo-app --tail=50
```

## Monitoring

```bash
# Watch pod status
kubectl get pods -n demo-app -w

# Check HPA status
kubectl get hpa -n demo-app

# Describe deployment
kubectl describe deployment demo-app -n demo-app
```

## Cleanup

```bash
kubectl delete namespace demo-app
```

## Best Practices Implemented

1. **Security**: NetworkPolicies, RBAC, non-root containers
2. **Reliability**: Health probes, resource limits, replicas
3. **Scalability**: HPA, resource requests
4. **Observability**: Labels, annotations, structured logging
5. **Configuration**: External config via ConfigMaps/Secrets
