# Namespace Strategy

## Namespaces

| Namespace | Purpose | Components |
|-----------|---------|------------|
| `gateway` | AI gateway services | LiteLLM, Redis |
| `observability` | Monitoring and tracing | Prometheus, Grafana, Loki, Alloy, Mimir, Langfuse |
| `security` | Security tooling | Kyverno, Falco, CrowdSec |
| `ingress` | Traffic ingress | ingress-nginx, cert-manager |
| `secrets` | Secret management | Infisical operator |
| `argocd` | GitOps | Argo CD |
| `gpu` | GPU workloads | vLLM |

## Resource Quotas

Each namespace should define resource quotas to prevent resource exhaustion. Quotas are enforced by Kyverno policies.

## Labels

All namespaces use standard labels:
```yaml
metadata:
  labels:
    app.kubernetes.io/part-of: jaimsnet
    app.kubernetes.io/managed-by: argocd
```
