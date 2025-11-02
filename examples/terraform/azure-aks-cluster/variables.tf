variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westeurope"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "aks-demo"
}

variable "kubernetes_version" {
  description = "Kubernetes version for AKS cluster (update regularly to match supported versions)"
  type        = string
  default     = "1.29"
}

variable "system_node_count" {
  description = "Number of nodes in the system node pool"
  type        = number
  default     = 2

  validation {
    condition     = var.system_node_count >= 1 && var.system_node_count <= 10
    error_message = "System node count must be between 1 and 10."
  }
}

variable "user_node_count" {
  description = "Number of nodes in the user node pool"
  type        = number
  default     = 2

  validation {
    condition     = var.user_node_count >= 0 && var.user_node_count <= 100
    error_message = "User node count must be between 0 and 100."
  }
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "network_plugin" {
  description = "Network plugin to use for networking (azure or kubenet)"
  type        = string
  default     = "azure"

  validation {
    condition     = contains(["azure", "kubenet"], var.network_plugin)
    error_message = "Network plugin must be azure or kubenet."
  }
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for node pools"
  type        = bool
  default     = true
}

variable "min_node_count" {
  description = "Minimum number of nodes for auto-scaling"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for auto-scaling"
  type        = number
  default     = 5
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Purpose   = "Demo"
  }
}
