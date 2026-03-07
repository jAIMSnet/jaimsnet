# Network Policies

## Default Policy

All namespaces have a default-deny ingress policy. Services must explicitly allow traffic.

## Inter-Namespace Communication

| Source | Destination | Port | Purpose |
|--------|-------------|------|---------|
| `ingress` | `gateway` | 4000 | LiteLLM API |
| `ingress` | `observability` | 3000 | Langfuse UI |
| `ingress` | `observability` | 3001 | Grafana UI |
| `gateway` | `observability` | 3000 | LiteLLM → Langfuse tracing |
| `gateway` | `gateway` | 6379 | LiteLLM → Redis cache |
| `observability` | All | 9090 | Prometheus scraping |
| `security` | All | Various | Falco monitoring, Kyverno admission |

## Implementation

Network policies are enforced by the Kubernetes CNI (Cilium on DOKS). Policies will be defined as Kubernetes NetworkPolicy resources managed via Argo CD.
