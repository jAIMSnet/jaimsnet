# Observability — Full Observability Stack

| Field | Value |
|-------|-------|
| **Status** | 🔄 Phase 1 In Progress |
| **Last Updated** | 2026-03-06 |

## Architecture (3 Layers)

| Layer | Tool | Target | Status |
|-------|------|--------|--------|
| **AI / LLM** | Langfuse | LLM traces, token costs, user attribution | ⬜ Phase 1 |
| **Infrastructure** | Prometheus + Grafana + Loki | Cluster metrics, dashboards, logs | ⬜ Phase 2 |
| **Endpoint Health** | Uptime Kuma | HTTP/TCP endpoint monitoring | ⬜ Phase 1 |

## Components

| Component | Directory | Deployment | Status |
|-----------|-----------|-----------|--------|
| Langfuse | `langfuse/` | Helm (K8s) | ⬜ Phase 1 |
| Uptime Kuma | `uptime-kuma/` | Docker Compose (Droplet) | ⬜ Phase 1 |
| Prometheus | `prometheus/` | Helm (K8s) | ⬜ Phase 2 |
| Grafana | `grafana/` | Helm (K8s) | ⬜ Phase 2 |
| Loki | `loki/` | Helm (K8s) | ⬜ Phase 2 |
