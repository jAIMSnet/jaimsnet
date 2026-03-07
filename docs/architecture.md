# Architecture Overview

## System Design

jAIMSnet is built on a Kubernetes-native architecture running on DigitalOcean Managed Kubernetes (DOKS). The platform follows GitOps principles with Argo CD managing all cluster deployments.

## Network Flow

```
Internet → ingress-nginx (TLS via cert-manager)
    ├── api.jaimsnet.com    → LiteLLM (AI Gateway)
    ├── trace.jaimsnet.com  → Langfuse (LLM Observability)
    ├── grafana.jaimsnet.com → Grafana (Dashboards)
    └── status.jaimsnet.com → Uptime Kuma (Status Page)
```

## Component Architecture

### AI Gateway Layer
LiteLLM serves as the unified gateway for all AI model access. It provides:
- Unified API across multiple LLM providers (OpenAI, Anthropic, self-hosted)
- API key management and rate limiting
- Request/response logging to Langfuse
- Redis-backed caching for repeated queries
- Cost tracking and budget controls

### Observability Stack
The observability layer uses a combination of Grafana ecosystem tools and Langfuse:
- **Prometheus** — Metrics collection from all Kubernetes workloads
- **Grafana** — Visualization dashboards for infrastructure and application metrics
- **Loki** — Centralized log aggregation with LogQL query language
- **Alloy** — OpenTelemetry collector for traces and metrics forwarding
- **Mimir** — Long-term metrics storage backend for Prometheus
- **Langfuse** — LLM-specific observability with tracing, evaluation, and prompt management
- **Uptime Kuma** — External uptime monitoring and status page

### Secret Management
Infisical provides centralized secret management:
- Kubernetes operator syncs secrets from Infisical to cluster
- Automatic rotation with configurable intervals
- Audit logging for all secret access
- Environment-based secret scoping (dev, staging, production)

### Security Layer
Defense-in-depth security approach:
- **Kyverno** — Policy-as-code for Kubernetes admission control
- **Trivy** — Container image vulnerability scanning in CI/CD
- **Falco** — Runtime threat detection via system call monitoring
- **CrowdSec** — Collaborative intrusion detection and IP reputation
- **kube-bench** — CIS Kubernetes benchmark compliance checking
- **docker-bench** — Docker host security auditing

### Infrastructure
- **DigitalOcean DOKS** — Managed Kubernetes cluster
- **OpenTofu** — Infrastructure provisioning (VPC, cluster, DNS, databases)
- **Ansible** — Configuration management for VM-based workloads (GPU nodes, monitoring)

## Namespace Strategy

| Namespace | Purpose |
|-----------|---------|
| `gateway` | LiteLLM, Redis |
| `observability` | Prometheus, Grafana, Loki, Alloy, Mimir, Langfuse |
| `security` | Kyverno, Falco, CrowdSec |
| `ingress` | ingress-nginx, cert-manager |
| `secrets` | Infisical operator |
| `argocd` | Argo CD |
| `gpu` | vLLM workloads |

## Data Flow

1. Client sends API request to `api.jaimsnet.com`
2. ingress-nginx terminates TLS and routes to LiteLLM
3. LiteLLM checks Redis cache for cached responses
4. On cache miss, LiteLLM forwards to appropriate model provider
5. Request/response logged to Langfuse for observability
6. Metrics exported to Prometheus, logs to Loki via Alloy
