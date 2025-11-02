# Azure AKS Cluster with Terraform

This example demonstrates Infrastructure as Code best practices for deploying an Azure Kubernetes Service (AKS) cluster with supporting infrastructure.

## Architecture

- **AKS Cluster**: Production-ready Kubernetes cluster with system and user node pools
- **Azure Container Registry**: Private container registry with admin access disabled
- **Virtual Network**: Dedicated VNet with subnet for AKS
- **Managed Identity**: Azure AD integration for secure resource access
- **Log Analytics**: Centralized monitoring and logging

## Features

- ✅ Multi-node pool configuration (system and user pools)
- ✅ Network policy support (Azure CNI)
- ✅ Azure AD RBAC integration
- ✅ Auto-scaling enabled
- ✅ Azure Monitor integration
- ✅ Private container registry
- ✅ Secure defaults and best practices

## Prerequisites

- Azure CLI installed and authenticated
- Terraform >= 1.0
- Appropriate Azure subscription permissions

## Usage

```bash
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the configuration
terraform apply

# Get AKS credentials
az aks get-credentials --resource-group <rg-name> --name <cluster-name>
```

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| environment | Environment name | string | dev |
| location | Azure region | string | westeurope |
| kubernetes_version | AKS Kubernetes version | string | 1.28 |
| node_count | Default node count | number | 2 |

## Outputs

- `aks_cluster_name`: Name of the AKS cluster
- `acr_login_server`: Container registry URL
- `resource_group_name`: Resource group name

## Best Practices Implemented

1. **Security**: Managed identities, private endpoints, RBAC
2. **Scalability**: Auto-scaling configuration
3. **Monitoring**: Log Analytics and Azure Monitor
4. **Networking**: Azure CNI with network policies
5. **High Availability**: Multi-zone deployment support
