# jAIMSnet

AI-native infrastructure platform providing secure, observable, and cost-effective AI/ML services on Kubernetes.

## Overview

jAIMSnet is a production-grade platform for deploying and managing AI/ML workloads. It provides a unified gateway for LLM access, comprehensive observability, automated secret management, and security-hardened Kubernetes infrastructure running on DigitalOcean.

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        Internet                                 │
└──────────────────────────┬──────────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────────┐
│                    ingress-nginx                                 │
│                  + cert-manager (TLS)                            │
└──────────┬───────────────┬──────────────────────────────────────┘
           │               │
┌──────────▼───────┐ ┌─────▼────────────┐
│   LiteLLM        │ │   Langfuse        │
│   (AI Gateway)   │ │   (Observability) │
│   + Redis Cache  │ │                   │
└──────────┬───────┘ └──────────────────-┘
           │
┌──────────▼───────────────────────────────────────────────────────┐
│              AI Model Providers                                   │
│   OpenAI │ Anthropic │ vLLM (self-hosted) │ Others               │
└──────────────────────────────────────────────────────────────────┘
```

## Repository Structure

```
jaimsnet/
├── .github/              # GitHub workflows, CODEOWNERS, PR templates
├── docs/                 # Architecture docs, ADRs, runbooks
│   ├── decisions/        # Architecture Decision Records
│   └── runbooks/         # Operational runbooks
├── cluster/              # Kubernetes cluster configuration
├── ingress/              # Ingress controllers and TLS
│   ├── ingress-nginx/    # NGINX ingress controller
│   └── cert-manager/     # Automated TLS certificates
├── secrets/              # Secret management
│   └── infisical/        # Infisical operator and sync configs
├── gateway/              # AI gateway layer
│   ├── litellm/          # LiteLLM proxy configuration
│   └── redis/            # Redis cache for gateway
├── observability/        # Monitoring and observability stack
│   ├── langfuse/         # LLM observability
│   ├── prometheus/       # Metrics collection
│   ├── grafana/          # Dashboards and visualization
│   ├── loki/             # Log aggregation
│   ├── alloy/            # OpenTelemetry collector
│   ├── mimir/            # Long-term metrics storage
│   └── uptime-kuma/      # Uptime monitoring
├── gpu/                  # GPU workloads
│   └── vllm/             # vLLM model serving
├── iac/                  # Infrastructure as Code
│   ├── opentofu/         # Cloud infrastructure (DigitalOcean)
│   └── ansible/          # Configuration management
├── gitops/               # GitOps tooling
│   ├── argocd/           # Argo CD application definitions
│   └── watchtower/       # Container image updates
├── security/             # Security tooling
│   ├── kyverno/          # Policy engine
│   ├── trivy/            # Vulnerability scanning
│   ├── falco/            # Runtime security
│   ├── crowdsec/         # Intrusion detection
│   ├── kube-bench/       # CIS benchmark checks
│   └── docker-bench/     # Docker security checks
├── compliance/           # Compliance frameworks and evidence
│   ├── frameworks/       # SOC2, HIPAA, GDPR, etc.
│   ├── policies/         # Organizational policies
│   └── evidence/         # Compliance evidence collection
├── testing/              # Testing infrastructure
│   ├── integration/      # Integration tests
│   ├── load/             # Load and performance tests
│   └── chaos/            # Chaos engineering tests
└── scripts/              # Utility scripts
```

## Components

| Component | Purpose | Status |
|-----------|---------|--------|
| LiteLLM | Unified AI model gateway with key management | 🟡 Planned |
| Langfuse | LLM observability, tracing, and evaluation | 🟡 Planned |
| Infisical | Secret management with Kubernetes operator | 🟡 Planned |
| ingress-nginx | Kubernetes ingress controller | 🟡 Planned |
| cert-manager | Automated TLS certificate management | 🟡 Planned |
| Prometheus | Metrics collection and alerting | 🟡 Planned |
| Grafana | Metrics visualization and dashboards | 🟡 Planned |
| Loki | Log aggregation and querying | 🟡 Planned |
| Alloy | OpenTelemetry collector (Grafana) | 🟡 Planned |
| Mimir | Long-term metrics storage (Grafana) | 🟡 Planned |
| Uptime Kuma | External uptime monitoring | 🟡 Planned |
| vLLM | Self-hosted model inference | 🟡 Planned |
| Argo CD | GitOps continuous delivery | 🟡 Planned |
| Kyverno | Kubernetes policy engine | 🟡 Planned |
| Trivy | Container vulnerability scanning | 🟡 Planned |
| Falco | Runtime threat detection | 🟡 Planned |
| CrowdSec | Collaborative intrusion detection | 🟡 Planned |

## Technology Stack

- **Cloud Provider**: DigitalOcean (DOKS — managed Kubernetes)
- **Infrastructure**: OpenTofu (Terraform-compatible IaC)
- **Configuration**: Ansible for VM-based workloads
- **GitOps**: Argo CD for Kubernetes deployments
- **Gateway**: LiteLLM for unified LLM API access
- **Observability**: Grafana stack (Prometheus, Loki, Alloy, Mimir) + Langfuse
- **Security**: Kyverno, Trivy, Falco, CrowdSec, kube-bench
- **Secrets**: Infisical with Kubernetes operator
- **GPU**: vLLM for self-hosted model inference

## Getting Started

### Prerequisites

- [kubectl](https://kubernetes.io/docs/tasks/tools/) v1.28+
- [Helm](https://helm.sh/docs/intro/install/) v3.12+
- [OpenTofu](https://opentofu.org/docs/intro/install/) v1.6+
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/) v2.15+
- DigitalOcean account with API token

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/jAIMSnet/jaimsnet.git
   cd jaimsnet
   ```

2. **Provision infrastructure**
   ```bash
   cd iac/opentofu/environments/production
   tofu init && tofu plan
   ```

3. **Deploy core services**
   ```bash
   # Argo CD handles deployment via GitOps
   kubectl apply -f gitops/argocd/applications/
   ```

See [docs/deployment-guide.md](docs/deployment-guide.md) for the full deployment guide.

## Documentation

- [Architecture Overview](docs/architecture.md)
- [Deployment Guide](docs/deployment-guide.md)
- [Architecture Decision Records](docs/decisions/)
- [Operational Runbooks](docs/runbooks/)

## Contributing

1. Create a feature branch from `main`
2. Make changes following the existing patterns
3. Submit a pull request using the provided template
4. Ensure all CI checks pass

See [.github/CODEOWNERS](.github/CODEOWNERS) for code ownership.

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.
