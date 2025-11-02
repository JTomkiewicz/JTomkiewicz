# Quick Start Guide

Get started with the DevOps examples in this repository in minutes!

## 🎯 Choose Your Path

### Path 1: Docker Enthusiast
**Time**: 10 minutes  
**Goal**: Run a containerized Node.js application

```bash
# Navigate to the Docker example
cd examples/docker/nodejs-app

# Build the Docker image
docker build -t demo-app:latest .

# Run the container
docker run -d -p 3000:3000 --name demo-app demo-app:latest

# Test the application
curl http://localhost:3000/health

# View logs
docker logs demo-app

# Stop and remove
docker stop demo-app && docker rm demo-app
```

**What you'll learn**:
- Multi-stage Docker builds
- Security best practices (non-root user)
- Health checks
- Container optimization

---

### Path 2: Kubernetes Explorer
**Time**: 15 minutes  
**Prerequisites**: Local Kubernetes cluster (minikube, kind, or Docker Desktop)

```bash
# Start your local Kubernetes cluster
# For Docker Desktop: Enable Kubernetes in settings
# For minikube: minikube start

# Navigate to Kubernetes examples
cd examples/kubernetes/microservice-deployment

# Create namespace
kubectl apply -f namespace.yaml

# Deploy all resources
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f serviceaccount.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Check deployment
kubectl get all -n demo-app

# View pod logs
kubectl logs -n demo-app -l app=demo-app

# Port forward to access locally
kubectl port-forward -n demo-app service/demo-app-service 8080:80

# Test the application
curl http://localhost:8080/health

# Cleanup
kubectl delete namespace demo-app
```

**What you'll learn**:
- Kubernetes Deployments and Services
- ConfigMaps and Secrets
- RBAC and Service Accounts
- Health checks and probes
- Multi-replica applications

---

### Path 3: Terraform Practitioner
**Time**: 20 minutes  
**Prerequisites**: Terraform CLI, Azure CLI (authenticated)

```bash
# Navigate to Terraform example
cd examples/terraform/azure-aks-cluster

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Format check
terraform fmt -check

# Review the plan (dry-run, no resources created)
terraform plan

# Optional: Apply (creates real Azure resources - costs apply)
# terraform apply
```

**What you'll learn**:
- Terraform project structure
- Azure resource provisioning
- Variables and outputs
- Best practices for IaC
- Resource organization

---

### Path 4: CI/CD Developer
**Time**: 5 minutes  
**Goal**: Understand pipeline structure

```bash
# View Azure DevOps pipeline examples
cat examples/azure-devops-pipelines/docker-build-push.yml
cat examples/azure-devops-pipelines/terraform-pipeline.yml

# View GitHub Actions workflows
cat .github/workflows/docker.yml
cat .github/workflows/terraform.yml
```

**What you'll learn**:
- Multi-stage pipeline design
- Security scanning integration
- Deployment strategies
- Approval gates
- Best practices for CI/CD

---

## 🚀 Development Environment Setup

### Prerequisites

Install the following tools based on which path you're taking:

#### For All Paths
```bash
# Git
git --version

# Text editor (VS Code recommended)
code --version
```

#### For Docker Path
```bash
# Docker
docker --version
docker-compose --version
```

#### For Kubernetes Path
```bash
# kubectl
kubectl version --client

# Local Kubernetes (choose one)
docker --version  # Docker Desktop with Kubernetes
# OR
minikube version
# OR
kind version
```

#### For Terraform Path
```bash
# Terraform
terraform version

# Azure CLI (for Azure examples)
az --version
az login
```

---

## 📖 Recommended Learning Path

### Week 1: Containerization Basics
1. Complete **Docker Path** above
2. Read [Docker README](./examples/docker/nodejs-app/README.md)
3. Experiment with Docker Compose
4. Try modifying the Node.js application

### Week 2: Container Orchestration
1. Complete **Kubernetes Path** above
2. Read [Kubernetes README](./examples/kubernetes/microservice-deployment/README.md)
3. Explore HPA and Network Policies
4. Deploy multiple applications

### Week 3: Infrastructure as Code
1. Complete **Terraform Path** above
2. Read [Terraform README](./examples/terraform/azure-aks-cluster/README.md)
3. Understand state management
4. Modify variables and see the impact

### Week 4: CI/CD Automation
1. Complete **CI/CD Path** above
2. Read [Azure DevOps Pipelines README](./examples/azure-devops-pipelines/README.md)
3. Set up a simple pipeline
4. Add security scanning

---

## 🎓 Learning Resources

### Official Documentation
- [Docker Documentation](https://docs.docker.com/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Terraform Documentation](https://www.terraform.io/docs/)
- [Azure Documentation](https://docs.microsoft.com/azure/)

### Interactive Learning
- [Docker Labs](https://labs.play-with-docker.com/)
- [Kubernetes Playground](https://labs.play-with-k8s.com/)
- [Terraform Tutorials](https://learn.hashicorp.com/terraform)
- [Azure Learn](https://learn.microsoft.com/training/azure/)

### Books (Recommended)
- "Docker Deep Dive" by Nigel Poulton
- "Kubernetes Up & Running" by Kelsey Hightower
- "Terraform: Up & Running" by Yevgeniy Brikman
- "The DevOps Handbook" by Gene Kim

---

## 🔧 Troubleshooting

### Docker Issues

**Problem**: Port already in use
```bash
# Find what's using the port
lsof -i :3000  # macOS/Linux
netstat -ano | findstr :3000  # Windows

# Use a different port
docker run -d -p 3001:3000 --name demo-app demo-app:latest
```

**Problem**: Permission denied
```bash
# Add your user to docker group (Linux)
sudo usermod -aG docker $USER
# Log out and back in
```

### Kubernetes Issues

**Problem**: ImagePullBackOff
```bash
# Check the image name and availability
kubectl describe pod -n demo-app <pod-name>

# For local images with minikube
minikube image load demo-app:latest
```

**Problem**: kubectl command not found
```bash
# Install kubectl
# macOS
brew install kubectl

# Linux
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

### Terraform Issues

**Problem**: Authentication failed
```bash
# Login to Azure
az login

# Verify subscription
az account show

# Set default subscription if needed
az account set --subscription "Your Subscription Name"
```

**Problem**: State lock
```bash
# If you encounter a state lock error
terraform force-unlock <lock-id>
```

---

## 💡 Tips for Success

### Best Practices
1. **Start Small**: Begin with simple examples, then progress to complex ones
2. **Read Documentation**: Each example has detailed README files
3. **Experiment**: Modify examples to understand how they work
4. **Use Version Control**: Track your changes with Git
5. **Ask Questions**: Open issues for clarification

### Common Mistakes to Avoid
- ❌ Skipping the README files
- ❌ Not cleaning up resources (costs money in cloud)
- ❌ Ignoring security best practices
- ❌ Not using `.gitignore` for sensitive files
- ❌ Hardcoding credentials

### Security Reminders
- ✅ Never commit secrets to Git
- ✅ Use environment variables for credentials
- ✅ Scan containers for vulnerabilities
- ✅ Follow principle of least privilege
- ✅ Keep dependencies updated

---

## 🎯 Next Steps

After completing the quick start:

1. **Explore More Examples**: Check out [examples/README.md](./examples/README.md)
2. **Review Architecture**: See [docs/diagrams/](./docs/diagrams/)
3. **Check Skills Matrix**: Review [docs/SKILLS_MATRIX.md](./docs/SKILLS_MATRIX.md)
4. **Contribute**: Read [CONTRIBUTING.md](./CONTRIBUTING.md)

---

## 📞 Get Help

Need assistance?

- **Documentation**: Check [docs/](./docs/)
- **Issues**: [Open an issue](https://github.com/JTomkiewicz/JTomkiewicz/issues)
- **LinkedIn**: [linkedin.com/in/jtomkiewicz](https://linkedin.com/in/jtomkiewicz)
- **Email**: contact@jtomkiewicz.dev

---

## 🌟 Show Your Support

If you find these examples helpful:
- ⭐ Star this repository
- 🔄 Share with others
- 💬 Provide feedback
- 🤝 Contribute improvements

---

Happy Learning! 🚀

[⬆ Back to Main README](./README.md)
