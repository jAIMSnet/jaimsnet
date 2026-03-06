# jAIMSnet — AI Infrastructure Platform

> **jAIMS** (jAI Management System) is a self-hosted, production-grade AI gateway and observability platform built on Kubernetes. It provides unified model routing, rate-limiting, cost tracking, and end-to-end LLM observability for engineering teams running private and third-party AI workloads.

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Key Components](#key-components)
- [Directory Structure](#directory-structure)
- [Quick Start](#quick-start)
- [Deployment Phases](#deployment-phases)
- [Cost](#cost)
- [Team](#team)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

jAIMSnet manages the complete lifecycle of AI model traffic — from the moment a request enters the cluster, through routing and caching, to observability and cost attribution. It is designed to be **operator-friendly**, **secret-safe**, and **incrementally deployable**.

| Goal | Solution |
|---|---|
| Unified AI gateway | [LiteLLM](https://litellm.ai) Proxy |
| LLM observability & tracing | [Langfuse](https://langfuse.com) |
| Secret management | [Infisical](https://infisical.com) Operator |
| TLS automation | [cert-manager](https://cert-manager.io) + Let's Encrypt |
| Ingress & routing | [ingress-nginx](https://kubernetes.github.io/ingress-nginx/) |
| Response caching | [Redis](https://redis.io) |
| Endpoint monitoring | [Uptime Kuma](https://uptime.kuma.pet) |
| Infrastructure as Code | [OpenTofu](https://opentofu.org) |
| Metrics & dashboards *(Phase 2)* | Prometheus + Grafana + Loki |
| GPU inference *(Phase 2)* | vLLM on AMD MI300X |
| GitOps *(Phase 3)* | ArgoCD |
| Security scanning *(Phase 3)* | Trivy, Kyverno, CrowdSec, Falco |

---

## Architecture

```
                        ┌─────────────────────────────────────────────────────┐
                        │                   DOKS Cluster                       │
                        │                                                       │
  Internet              │  ┌──────────────┐      ┌───────────────────────┐    │
  ─────────►  ingress   │  │  ingress-    │      │      cert-manager     │    │
             (443/80)   │  │  nginx       │      │  (Let's Encrypt TLS)  │    │
                        │  └──────┬───────┘      └───────────────────────┘    │
                        │         │                                             │
                        │   ┌─────▼──────────────────────────┐                │
                        │   │           litellm               │                │
                        │   │   AI Gateway / Proxy            │                │
                        │   │  - Model routing & aliases      │                │
                        │   │  - Rate limiting & budgets      │◄──── Redis     │
                        │   │  - Fallback chains              │    (caching)   │
                        │   │  - Cost tracking                │                │
                        │   └─────────────┬───────────────────┘                │
                        │                 │  callbacks / traces                 │
                        │   ┌─────────────▼───────────────────┐                │
                        │   │           langfuse              │                │
                        │   │   LLM Observability             │                │
                        │   │  - Request/response tracing     │                │
                        │   │  - Token usage & cost per user  │                │
                        │   │  - Prompt versioning & evals    │                │
                        │   └─────────────────────────────────┘                │
                        │                                                       │
                        │   ┌─────────────────────────────────┐                │
                        │   │           infisical             │                │
                        │   │   Secret Operator               │                │
                        │   │  - Syncs secrets from Infisical │                │
                        │   │    cloud → K8s Secrets          │                │
                        │   │  - No secrets committed to Git  │                │
                        │   └─────────────────────────────────┘                │
                        │                                                       │
                        │   ┌──────────────────────────────────────────────┐   │
                        │   │  Phase 2: monitoring/              Phase 2:  │   │
                        │   │  Prometheus · Grafana · Loki     GPU / vLLM  │   │
                        │   └──────────────────────────────────────────────┘   │
                        └─────────────────────────────────────────────────────┘

  External AI Providers (OpenAI, Anthropic, Gemini, …)  ◄── LiteLLM routes to
  Self-hosted vLLM on AMD MI300X (Phase 2)              ◄──   these backends
```

### Traffic Flow

1. **Client** sends an OpenAI-compatible request to `litellm.jAIMS.app`.
2. **ingress-nginx** terminates TLS (cert managed by cert-manager) and proxies to LiteLLM.
3. **LiteLLM** applies routing rules, checks the Redis cache, enforces budgets, and forwards to the appropriate upstream model provider.
4. **Langfuse** receives structured traces via LiteLLM callbacks and stores them for analysis.
5. **Infisical Operator** keeps all provider API keys and service credentials synced as Kubernetes Secrets — nothing secret ever touches Git.

---

## Key Components

### AI Gateway (`gateway/`)
LiteLLM Proxy is the core AI gateway. Exposes an OpenAI-compatible API that routes to multiple model providers (OpenAI, Anthropic, Google Gemini, self-hosted vLLM, etc.). Supports:
- Named model aliases (`smart`, `fast`, `code`, `reason`, `long`, `complex`, `budget`, `embed`)
- Fallback chains for reliability
- Redis-backed response caching
- Per-key and per-user budget enforcement
- Native Langfuse integration for observability callbacks

Redis runs in the same namespace as the gateway, providing response caching to reduce latency and provider costs.

### Observability (`observability/`)
Langfuse is the full-stack LLM observability platform. Captures every request and response as a trace, with token counts, latency, cost estimates, and user attribution. Uptime Kuma monitors HTTP/TCP endpoint health from a separate Droplet.

Phase 2 will add Prometheus, Grafana, and Loki for infrastructure-level metrics and log aggregation.

### Secrets (`secrets/`)
Infisical Kubernetes operator synchronizes secrets from Infisical Cloud into native Kubernetes Secrets. `InfisicalSecret` CRDs for each namespace live in `secrets/infisical/sync/`. **No credentials are stored in this repository.**

### Ingress & TLS (`ingress/`)
ingress-nginx is the cluster ingress controller with Load Balancer IP `129.212.240.75`. cert-manager automates TLS certificate provisioning and renewal using Let's Encrypt via the `letsencrypt-prod` ClusterIssuer.

### Infrastructure as Code (`iac/`)
OpenTofu manages cloud infrastructure provisioning (DOKS cluster, Droplets, DNS, Managed PostgreSQL). Ansible configures Docker Droplets. Phase 3.

---

## Directory Structure

```
jaimsnet/
├── README.md
├── .gitignore
│
├── docs/
│   ├── architecture.md
│   ├── deployment-guide.md
│   ├── decisions/              # ADRs 001-005
│   └── runbooks/               # Operations runbooks
│
├── cluster/                    # Cluster-level configs
│   ├── namespaces.yaml         # ✅ Applied
│   ├── cluster-issuer.yaml     # ✅ Applied
│   └── README.md
│
├── ingress/                    # Ingress + TLS
│   ├── ingress-nginx/
│   │   ├── values.yaml         # ✅ Deployed
│   │   └── README.md
│   ├── cert-manager/
│   │   ├── values.yaml         # ✅ Deployed (v1.19.4)
│   │   └── README.md
│   └── README.md
│
├── secrets/                    # Infisical operator + CRDs
│   ├── infisical/
│   │   ├── operator/
│   │   │   ├── values.yaml
│   │   │   └── README.md
│   │   ├── sync/
│   │   │   ├── litellm-secrets.yaml
│   │   │   ├── langfuse-secrets.yaml
│   │   │   └── redis-secrets.yaml
│   │   └── README.md
│   └── README.md
│
├── gateway/                    # LiteLLM + Redis (AI Gateway)
│   ├── litellm/
│   │   ├── values.yaml
│   │   ├── config.yaml         # Model routing aliases
│   │   ├── ingress.yaml        # litellm.jAIMS.app
│   │   └── README.md
│   ├── redis/
│   │   ├── values.yaml
│   │   └── README.md
│   └── README.md
│
├── observability/              # All observability tools
│   ├── langfuse/
│   │   ├── values.yaml
│   │   ├── ingress.yaml        # langfuse.jAIMS.app
│   │   └── README.md
│   ├── uptime-kuma/            # Docker Compose (Droplet)
│   │   ├── docker-compose.yaml
│   │   └── README.md
│   ├── prometheus/             # Phase 2
│   │   ├── values.yaml
│   │   └── README.md
│   ├── grafana/                # Phase 2
│   │   ├── values.yaml
│   │   └── README.md
│   ├── loki/                   # Phase 2
│   │   ├── values.yaml
│   │   └── README.md
│   └── README.md
│
├── iac/                        # Infrastructure as Code
│   ├── opentofu/
│   │   ├── environments/production/
│   │   ├── modules/{doks-cluster,droplet,database,dns,vpc}/
│   │   └── README.md
│   ├── ansible/
│   │   ├── inventory/
│   │   ├── playbooks/
│   │   ├── roles/
│   │   └── README.md
│   └── README.md
│
├── gpu/                        # Phase 2: vLLM on MI300X
│   ├── vllm/
│   │   ├── docker-compose.yaml
│   │   ├── gpu-health.sh
│   │   └── README.md
│   └── README.md
│
├── gitops/                     # Phase 3: ArgoCD + Watchtower
│   ├── argocd/
│   │   ├── values.yaml
│   │   ├── applications/
│   │   └── README.md
│   ├── watchtower/
│   │   ├── docker-compose.yaml
│   │   └── README.md
│   └── README.md
│
├── security/                   # Phase 3: Security stack
│   ├── trivy/
│   ├── kyverno/
│   │   └── policies/
│   ├── crowdsec/
│   ├── falco/
│   └── README.md
│
└── scripts/
    ├── generate-secrets.sh
    ├── backup-pg.sh
    ├── verify-cluster.sh
    └── README.md
```

---

## Quick Start

> **Prerequisites:** `kubectl`, `helm` (≥ 3.12), `doctl` (for DOKS), `tofu` (OpenTofu), access to an Infisical project with secrets populated.

```bash
# 1. Authenticate to the cluster
doctl kubernetes cluster kubeconfig save jaimsnet-cluster --context jaimsnet

# 2. Create namespaces
kubectl apply -f cluster/namespaces.yaml

# 3. Install cert-manager
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager --create-namespace \
  -f ingress/cert-manager/values.yaml

# 4. Apply the ClusterIssuer
kubectl apply -f cluster/cluster-issuer.yaml

# 5. Install ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  -f ingress/ingress-nginx/values.yaml

# 6. Install Infisical operator and sync secrets
helm upgrade --install infisical-operator infisical/infisical-operator \
  --namespace infisical --create-namespace \
  -f secrets/infisical/operator/values.yaml
kubectl apply -f secrets/infisical/sync/litellm-secrets.yaml
kubectl apply -f secrets/infisical/sync/langfuse-secrets.yaml
kubectl apply -f secrets/infisical/sync/redis-secrets.yaml

# 7. Deploy Redis + LiteLLM (AI Gateway)
helm upgrade --install redis bitnami/redis \
  --namespace gateway --create-namespace \
  -f gateway/redis/values.yaml
helm upgrade --install litellm litellm/litellm \
  --namespace gateway \
  -f gateway/litellm/values.yaml
kubectl apply -f gateway/litellm/ingress.yaml

# 8. Deploy Langfuse
helm upgrade --install langfuse langfuse/langfuse \
  --namespace observability --create-namespace \
  -f observability/langfuse/values.yaml
kubectl apply -f observability/langfuse/ingress.yaml

# 9. Verify cluster health
./scripts/verify-cluster.sh
```

For the full step-by-step guide, see [`docs/deployment-guide.md`](docs/deployment-guide.md).

---

## Deployment Phases

| Phase | Status | Components |
|-------|--------|-----------|
| **Phase 1 — Core AI Platform** | 🚧 In Progress | ingress-nginx, cert-manager, Infisical, Redis, LiteLLM, Langfuse, Uptime Kuma |
| **Phase 2 — Observability & GPU** | 📋 Planned | Prometheus, Grafana, Loki, vLLM on AMD MI300X |
| **Phase 3 — GitOps & Security** | 📋 Planned | ArgoCD, Watchtower, Trivy, Kyverno, CrowdSec, Falco, OpenTofu, Ansible |

---

## Cost

| Resource | Spec | Cost |
|----------|------|------|
| DOKS Cluster (1 node) | Premium AMD 2vCPU/8GiB | ~$48/mo |
| DOKS Cluster (2 nodes, max) | Premium AMD 2vCPU/8GiB × 2 | ~$96/mo |
| DO Managed PostgreSQL | 1vCPU/1GiB, ATL1 | ~$15/mo |
| DO Load Balancer | Standard | ~$12/mo |
| Uptime Kuma Droplet | 1vCPU/1GiB | ~$6/mo |
| Infisical Cloud Pro | — | ~$0–$9/mo |
| **Total (Phase 1, 1 node)** | | **~$81/mo** |

---

## Team

| Handle | Role |
|--------|------|
| @RMN | Owner / Architect |
| @GTM | Stakeholder |
| @SHD | DevOps / Operations |

---

## Contributing

1. All secrets must be stored in Infisical — never in Git.
2. Each component lives in a logical directory with a `README.md`.
3. Infrastructure is managed with OpenTofu (`iac/opentofu/`) — never Terraform.
4. Significant architectural decisions are recorded as ADRs in `docs/decisions/`.
5. See [`docs/deployment-guide.md`](docs/deployment-guide.md) for the operational workflow.

---

## License

Private repository — all rights reserved.
