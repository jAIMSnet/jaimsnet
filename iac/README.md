# IAC — Infrastructure as Code

| Field | Value |
|-------|-------|
| **Status** | ⬜ Phase 3 |
| **Last Updated** | 2026-03-06 |

## Tools

| Tool | Directory | Purpose | Status |
|------|-----------|---------|--------|
| OpenTofu | `opentofu/` | Provision Droplets, DOKS, DB, DNS | ⬜ Phase 3 |
| Ansible | `ansible/` | Configure Docker Droplets | ⬜ Phase 3 |

## Separation of Concerns

| Layer | Tool | What It Manages |
|-------|------|----------------|
| **Provisioning** | OpenTofu | Create/destroy Droplets, clusters, databases, DNS |
| **Configuration** | Ansible | Install Docker, configure firewall, deploy Compose files |
| **K8s Apps** | Helm | Deploy LiteLLM, Langfuse, Prometheus, etc. |
| **GitOps** | ArgoCD | Auto-deploy Helm changes from Git |
