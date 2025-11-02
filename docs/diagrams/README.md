# Architecture Diagrams

This directory contains architecture diagrams and visual documentation for the DevOps examples.

## Azure AKS Architecture

```mermaid
graph TB
    subgraph "Azure Cloud"
        subgraph "Resource Group"
            subgraph "Virtual Network"
                subgraph "AKS Subnet"
                    AKS[Azure Kubernetes Service]
                    SystemPool[System Node Pool]
                    UserPool[User Node Pool]
                    AKS --> SystemPool
                    AKS --> UserPool
                end
            end
            
            ACR[Azure Container Registry]
            LA[Log Analytics Workspace]
            MI[Managed Identity]
            
            AKS -.->|Pull Images| ACR
            AKS -.->|Send Logs| LA
            AKS -->|Uses| MI
        end
        
        subgraph "External"
            LB[Azure Load Balancer]
            DNS[Azure DNS]
        end
        
        LB --> AKS
        DNS -.-> LB
    end
    
    subgraph "Workloads"
        Pods[Application Pods]
        HPA[Horizontal Pod Autoscaler]
        NP[Network Policies]
        
        AKS --> Pods
        HPA -.->|Scales| Pods
        NP -.->|Secures| Pods
    end
    
    Users[End Users] --> DNS
    DevOps[DevOps Team] -.->|Deploy via| Pipeline[CI/CD Pipeline]
    Pipeline -.->|Push Images| ACR
    Pipeline -.->|Deploy to| AKS
    
    style AKS fill:#326CE5,color:#fff
    style ACR fill:#0078D4,color:#fff
    style LA fill:#0078D4,color:#fff
```

## CI/CD Pipeline Flow

```mermaid
graph LR
    subgraph "Source Control"
        GIT[Git Repository]
    end
    
    subgraph "CI Pipeline"
        BUILD[Build & Test]
        SCAN[Security Scan]
        DOCKER[Build Docker Image]
        
        GIT --> BUILD
        BUILD --> SCAN
        SCAN --> DOCKER
    end
    
    subgraph "Container Registry"
        ACR[Azure Container Registry]
        DOCKER --> ACR
    end
    
    subgraph "CD Pipeline"
        DEV[Deploy to Dev]
        TEST[Run Tests]
        PROD[Deploy to Prod]
        
        ACR --> DEV
        DEV --> TEST
        TEST -->|Manual Approval| PROD
    end
    
    subgraph "Kubernetes Cluster"
        AKS_DEV[AKS Development]
        AKS_PROD[AKS Production]
        
        DEV --> AKS_DEV
        PROD --> AKS_PROD
    end
    
    MONITOR[Azure Monitor] -.->|Observability| AKS_DEV
    MONITOR -.->|Observability| AKS_PROD
    
    style BUILD fill:#2088FF,color:#fff
    style SCAN fill:#FFA500,color:#000
    style DOCKER fill:#2496ED,color:#fff
    style ACR fill:#0078D4,color:#fff
```

## Docker Multi-Stage Build

```mermaid
graph TB
    subgraph "Stage 1: Dependencies"
        BASE1[node:20-alpine]
        DEPS[Install Production Dependencies]
        BASE1 --> DEPS
    end
    
    subgraph "Stage 2: Build"
        BASE2[node:20-alpine]
        ALL_DEPS[Install All Dependencies]
        BUILD[Build Application]
        BASE2 --> ALL_DEPS
        ALL_DEPS --> BUILD
    end
    
    subgraph "Stage 3: Production"
        BASE3[node:20-alpine]
        COPY_DEPS[Copy Production node_modules]
        COPY_APP[Copy Application Code]
        USER[Set Non-Root User]
        HEALTH[Add Health Check]
        
        BASE3 --> COPY_DEPS
        DEPS -.->|from stage 1| COPY_DEPS
        BUILD -.->|from stage 2| COPY_APP
        COPY_DEPS --> COPY_APP
        COPY_APP --> USER
        USER --> HEALTH
    end
    
    HEALTH --> FINAL[Final Image<br/>~50MB]
    
    style BASE1 fill:#339933,color:#fff
    style BASE2 fill:#339933,color:#fff
    style BASE3 fill:#339933,color:#fff
    style FINAL fill:#2496ED,color:#fff
```

## Kubernetes Application Architecture

```mermaid
graph TB
    subgraph "Ingress Layer"
        INGRESS[NGINX Ingress Controller]
        CERT[cert-manager]
        CERT -.->|TLS Certs| INGRESS
    end
    
    subgraph "Service Layer"
        SVC[ClusterIP Service]
        INGRESS --> SVC
    end
    
    subgraph "Application Layer"
        DEPLOY[Deployment]
        POD1[Pod 1]
        POD2[Pod 2]
        POD3[Pod 3]
        HPA[Horizontal Pod Autoscaler]
        
        SVC --> DEPLOY
        DEPLOY --> POD1
        DEPLOY --> POD2
        DEPLOY --> POD3
        HPA -.->|Auto-scales| DEPLOY
    end
    
    subgraph "Configuration"
        CM[ConfigMap]
        SECRET[Secret]
        SA[Service Account]
        
        POD1 -.->|Reads| CM
        POD1 -.->|Reads| SECRET
        POD1 -.->|Uses| SA
    end
    
    subgraph "Security"
        RBAC[RBAC Policies]
        NETPOL[Network Policies]
        PSP[Security Context]
        
        SA --> RBAC
        POD1 -.->|Enforced by| NETPOL
        POD1 -.->|Runs with| PSP
    end
    
    subgraph "Monitoring"
        PROM[Prometheus]
        LOGS[Log Aggregation]
        
        POD1 -.->|Metrics| PROM
        POD1 -.->|Logs| LOGS
    end
    
    style INGRESS fill:#269A99,color:#fff
    style DEPLOY fill:#326CE5,color:#fff
    style HPA fill:#326CE5,color:#fff
```

## Infrastructure as Code Workflow

```mermaid
graph LR
    subgraph "Development"
        CODE[Write Terraform Code]
        VALIDATE[Validate & Format]
        CODE --> VALIDATE
    end
    
    subgraph "CI Checks"
        LINT[Lint with tflint]
        SECURITY[Security Scan<br/>Checkov]
        PLAN[Terraform Plan]
        
        VALIDATE --> LINT
        LINT --> SECURITY
        SECURITY --> PLAN
    end
    
    subgraph "Review"
        PR[Pull Request]
        REVIEW[Code Review]
        APPROVAL[Approval]
        
        PLAN --> PR
        PR --> REVIEW
        REVIEW --> APPROVAL
    end
    
    subgraph "Deployment"
        MERGE[Merge to Main]
        APPLY[Terraform Apply]
        
        APPROVAL --> MERGE
        MERGE --> APPLY
    end
    
    subgraph "Azure Cloud"
        INFRA[Infrastructure Resources]
        STATE[Terraform State<br/>Azure Storage]
        
        APPLY --> INFRA
        APPLY -.->|Update| STATE
    end
    
    style CODE fill:#7B42BC,color:#fff
    style SECURITY fill:#FFA500,color:#000
    style APPLY fill:#7B42BC,color:#fff
    style INFRA fill:#0078D4,color:#fff
```

## Monitoring and Observability

```mermaid
graph TB
    subgraph "Application Layer"
        APP[Application Pods]
        METRICS_EP[/metrics Endpoint]
        LOGS_OUT[Log Output]
        
        APP --> METRICS_EP
        APP --> LOGS_OUT
    end
    
    subgraph "Collection Layer"
        PROM[Prometheus]
        FLUENTD[Fluentd/Fluent Bit]
        
        METRICS_EP -.->|Scrape| PROM
        LOGS_OUT -.->|Collect| FLUENTD
    end
    
    subgraph "Azure Monitor"
        LA[Log Analytics]
        AI[Application Insights]
        ALERTS[Azure Alerts]
        
        PROM -.->|Forward| LA
        FLUENTD --> LA
        APP -.->|Telemetry| AI
        LA -.->|Triggers| ALERTS
    end
    
    subgraph "Visualization"
        GRAFANA[Grafana Dashboards]
        PORTAL[Azure Portal]
        
        PROM --> GRAFANA
        LA --> PORTAL
    end
    
    subgraph "Notifications"
        EMAIL[Email]
        TEAMS[Microsoft Teams]
        SLACK[Slack]
        
        ALERTS --> EMAIL
        ALERTS --> TEAMS
        ALERTS --> SLACK
    end
    
    style PROM fill:#E6522C,color:#fff
    style LA fill:#0078D4,color:#fff
    style GRAFANA fill:#F46800,color:#fff
```

---

## Diagram Tools

These diagrams use Mermaid syntax and can be rendered in:
- GitHub Markdown
- Azure DevOps Wiki
- VS Code with Mermaid extension
- Mermaid Live Editor (https://mermaid.live)

## Usage

Copy the Mermaid code blocks into any Mermaid-compatible viewer to see the diagrams rendered.

## Contributing

When adding new diagrams:
1. Use consistent color schemes
2. Follow the existing style
3. Include a brief description
4. Test rendering in GitHub
