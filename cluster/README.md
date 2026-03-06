# Cluster — DOKS Cluster Configuration

| Field | Value |
|-------|-------|
| **Cluster Name** | `jaimsnet-cluster` |
| **Provider** | DigitalOcean Kubernetes (DOKS) |
| **Region** | ATL1 (Atlanta) |
| **Node** | Premium AMD 2vCPU / 8GiB |
| **Autoscale** | 1–2 nodes |
| **K8s Version** | 1.34.1 |
| **Load Balancer IP** | `129.212.240.75` |
| **Status** | ✅ Running |
| **Last Updated** | 2026-03-06 |

## Namespaces

| Namespace | Purpose | Status |
|-----------|---------|--------|
| `ingress-nginx` | Ingress controller | ✅ Active |
| `cert-manager` | TLS automation | ✅ Active |
| `gateway` | LiteLLM + Redis | ✅ Active |
| `observability` | Langfuse + metrics | ✅ Active |
| `infisical` | Secret operator | ⬜ Pending |

## Quick Commands

```bash
# Set kubectl context (DOKS)
doctl kubernetes cluster kubeconfig save jaimsnet-cluster --context jaimsnet

# Switch to cluster context
kubectl config use-context jaimsnet

# Verify nodes
kubectl get nodes -o wide

# Apply namespaces
kubectl apply -f namespaces.yaml

# Apply ClusterIssuer
kubectl apply -f cluster-issuer.yaml
```
