# GitOps — Continuous Deployment

| Field | Value |
|-------|-------|
| **Status** | ⬜ Phase 3 |
| **Last Updated** | 2026-03-06 |

## Strategy

| Target | Tool | How |
|--------|------|-----|
| **K8s cluster** | ArgoCD | Watches repo → auto-deploys Helm charts |
| **Docker Droplets** | Ansible + CI | GitHub Actions runs Ansible on push |
| **Docker image updates** | Watchtower | Auto-pulls new images on each Droplet |

## Components

| Component | Directory | Purpose | Status |
|-----------|-----------|---------|--------|
| ArgoCD | `argocd/` | K8s GitOps | ⬜ Phase 3 |
| Watchtower | `watchtower/` | Docker Droplet auto-updates | ⬜ Phase 3 |
