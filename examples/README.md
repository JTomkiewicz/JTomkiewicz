# DevOps Examples & Best Practices

This directory contains production-ready examples demonstrating DevOps best practices across various technologies and platforms.

## 📁 Directory Structure

```
examples/
├── terraform/              # Infrastructure as Code examples
│   └── azure-aks-cluster/  # Azure Kubernetes Service deployment
├── kubernetes/             # Kubernetes manifests
│   └── microservice-deployment/  # Production-ready K8s setup
├── docker/                 # Docker examples
│   └── nodejs-app/         # Multi-stage builds and best practices
└── azure-devops-pipelines/ # CI/CD pipeline examples
```

## 🏗️ Infrastructure as Code

### Azure AKS with Terraform
**Location**: `terraform/azure-aks-cluster/`

A complete, production-ready Azure Kubernetes Service cluster deployment showcasing:
- Multi-node pool architecture (system and user pools)
- Azure CNI networking with Network Policies
- Managed Identity for secure resource access
- Azure Monitor and Log Analytics integration
- Azure Container Registry with RBAC
- Auto-scaling configuration
- High availability setup

**Key Files**:
- `main.tf` - Main infrastructure resources
- `variables.tf` - Input variables with validation
- `outputs.tf` - Resource outputs
- `versions.tf` - Provider versions and backend config

**Technologies**: Terraform 1.6+, Azure AKS, ACR, VNet, Log Analytics

---

## ☸️ Kubernetes

### Microservice Deployment
**Location**: `kubernetes/microservice-deployment/`

Production-grade Kubernetes manifests for deploying a microservice application with:
- Deployment with multiple replicas and rolling updates
- ConfigMap and Secret management
- Service Account with RBAC
- ClusterIP Service
- Horizontal Pod Autoscaler (HPA)
- Network Policies for security
- Ingress with TLS support
- Health checks (liveness and readiness probes)
- Resource limits and requests
- Security contexts and pod security

**Key Features**:
- Non-root containers
- Read-only root filesystem
- Network segmentation
- Auto-scaling based on CPU/memory
- Zero-downtime deployments

**Technologies**: Kubernetes 1.24+, NGINX Ingress, cert-manager

---

## 🐳 Docker

### Node.js Multi-Stage Build
**Location**: `docker/nodejs-app/`

Optimized Docker setup for Node.js applications featuring:
- Multi-stage builds for minimal image size
- Alpine Linux base for reduced attack surface
- Non-root user execution
- Health checks
- Proper signal handling with dumb-init
- Development and production Dockerfiles
- Docker Compose for local development
- PostgreSQL and Redis integration

**Key Features**:
- Layer caching optimization
- Security hardening
- Minimal final image size
- Development hot-reload with volumes
- Production-ready health checks

**Technologies**: Docker, Node.js, Docker Compose, Alpine Linux

---

## 🔄 CI/CD Pipelines

### Azure DevOps Pipelines
**Location**: `azure-devops-pipelines/`

Enterprise-grade CI/CD pipeline examples:

#### 1. Docker Build and Push (`docker-build-push.yml`)
- Multi-stage pipeline for containerized apps
- Container security scanning with Trivy
- Push to Azure Container Registry
- Deployment to AKS (dev and prod)
- Approval gates for production

#### 2. Terraform Pipeline (`terraform-pipeline.yml`)
- Infrastructure validation and linting
- Security scanning with Checkov and tflint
- Terraform plan with artifact publishing
- Automated apply with approval gates
- State management in Azure Storage

#### 3. Node.js CI/CD (`nodejs-ci-cd.yml`)
- Build, test, and lint
- Code coverage reporting
- Docker image creation
- Multi-environment deployment
- Health checks and smoke tests

**Key Features**:
- Multi-stage pipelines
- Parallel job execution
- Caching for faster builds
- Security scanning integration
- Approval gates for production
- Variable groups for secrets management

**Technologies**: Azure DevOps, YAML Pipelines, Azure CLI

---

## 🚀 Getting Started

### Prerequisites

Depending on which examples you want to use:

- **Terraform**: Terraform CLI 1.0+, Azure CLI, Azure subscription
- **Kubernetes**: kubectl, Kubernetes cluster (local or cloud)
- **Docker**: Docker Engine, Docker Compose
- **Azure DevOps**: Azure DevOps organization, service connections

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/JTomkiewicz/JTomkiewicz.git
   cd JTomkiewicz/examples
   ```

2. **Choose an example**
   ```bash
   cd terraform/azure-aks-cluster  # or kubernetes/, docker/, etc.
   ```

3. **Follow the README**
   Each example directory contains a detailed README with:
   - Prerequisites
   - Usage instructions
   - Configuration options
   - Best practices explanation

### Security Considerations

All examples follow security best practices:
- ✅ Principle of least privilege
- ✅ Secrets management (no hardcoded credentials)
- ✅ Network security and policies
- ✅ Resource limits and quotas
- ✅ Regular security scanning
- ✅ Non-root container execution
- ✅ Encrypted communications

### Customization

These examples are designed to be:
- **Modular**: Use as-is or customize for your needs
- **Educational**: Learn DevOps best practices
- **Production-ready**: Adapt for real-world deployments

---

## 📚 Additional Resources

### Documentation
- [Azure Documentation](https://docs.microsoft.com/azure/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Terraform Registry](https://registry.terraform.io/)
- [Docker Documentation](https://docs.docker.com/)

### Best Practices
- [Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/)
- [Kubernetes Best Practices](https://kubernetes.io/docs/concepts/configuration/overview/)
- [Docker Security Best Practices](https://docs.docker.com/develop/security-best-practices/)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)

---

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE) file for details.

---

## 📧 Contact

**Jakub Tomkiewicz**
- LinkedIn: [linkedin.com/in/jtomkiewicz](https://linkedin.com/in/jtomkiewicz)
- GitHub: [@JTomkiewicz](https://github.com/jtomkiewicz)
- Email: contact@jtomkiewicz.dev

---

*These examples are continuously updated with the latest best practices and technologies.*
