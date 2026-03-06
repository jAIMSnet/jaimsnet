# ArgoCD — K8s GitOps

| Field | Value |
|-------|-------|
| **Helm Chart** | `argo/argo-cd` |
| **Namespace** | `argocd` |
| **Status** | ⬜ Phase 3 |
| **Last Updated** | 2026-03-06 |

## Overview

ArgoCD watches this repository and automatically deploys Helm chart changes to the DOKS cluster.
It is K8s-only — for Docker Droplets, use Ansible + Watchtower.

## Applications

| App | Path | Namespace | Status |
|-----|------|-----------|--------|
| litellm | `gateway/litellm/` | gateway | ⬜ Phase 3 |
| langfuse | `observability/langfuse/` | observability | ⬜ Phase 3 |
| prometheus | `observability/prometheus/` | observability | ⬜ Phase 3 |
