# Azure DevOps Pipeline Examples

Professional CI/CD pipeline examples demonstrating best practices for Azure DevOps.

## Pipelines

### 1. Docker Build and Push (`docker-build-push.yml`)
Complete CI/CD pipeline for containerized applications:
- Multi-stage Docker builds
- Container scanning
- Push to Azure Container Registry
- Deployment to AKS

### 2. Terraform Infrastructure (`terraform-pipeline.yml`)
Infrastructure as Code pipeline:
- Terraform validation and planning
- Security scanning with Checkov
- Automated apply with approval gates
- State management in Azure Storage

### 3. Node.js Application (`nodejs-ci-cd.yml`)
Full-stack application pipeline:
- Build and test
- Code quality checks
- Docker containerization
- Multi-environment deployment

## Features

✅ Multi-stage pipelines  
✅ Conditional execution  
✅ Template reusability  
✅ Security scanning integration  
✅ Approval gates for production  
✅ Variable groups and secrets management  
✅ Parallel job execution  
✅ Artifact management  

## Prerequisites

- Azure DevOps organization and project
- Service connections configured:
  - Azure Resource Manager
  - Azure Container Registry
  - Kubernetes
- Variable groups created
- Appropriate permissions

## Usage

1. Copy the desired pipeline YAML file to your repository
2. Update variables and service connection names
3. Create a new pipeline in Azure DevOps
4. Select the YAML file from your repository
5. Configure required variable groups and secrets
6. Run the pipeline

## Best Practices Implemented

1. **Security**: Scan containers and IaC, use managed identities
2. **Reliability**: Health checks, rollback strategies, approval gates
3. **Efficiency**: Caching, parallel jobs, incremental builds
4. **Observability**: Logging, notifications, pipeline analytics
5. **Compliance**: Code quality gates, test coverage requirements

## Pipeline Structure

```yaml
# Typical multi-stage pipeline structure
trigger: [main]

stages:
  - stage: Build
    jobs:
      - job: BuildAndTest
        steps: [...]
  
  - stage: DeployDev
    dependsOn: Build
    jobs:
      - deployment: DeployToDev
        environment: dev
        strategy:
          runOnce:
            deploy: [...]
  
  - stage: DeployProd
    dependsOn: DeployDev
    jobs:
      - deployment: DeployToProd
        environment: prod
        strategy:
          runOnce:
            deploy: [...]
```

## Variable Groups

Create the following variable groups in Azure DevOps:

- `common-variables`: Shared across all pipelines
- `dev-variables`: Development environment
- `prod-variables`: Production environment

## Service Connections

Required service connections:
- `azure-subscription`: Azure Resource Manager connection
- `acr-connection`: Azure Container Registry
- `aks-connection`: Azure Kubernetes Service
