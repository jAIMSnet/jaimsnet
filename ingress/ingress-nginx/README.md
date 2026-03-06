# ingress-nginx — Ingress Controller

| Field | Value |
|-------|-------|
| **Helm Chart** | `ingress-nginx/ingress-nginx` |
| **Namespace** | `ingress-nginx` |
| **Load Balancer IP** | `129.212.240.75` |
| **Status** | ✅ Deployed |
| **Last Updated** | 2026-03-06 |

## Deploy

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  -f values.yaml
```

## Verify

```bash
kubectl get svc -n ingress-nginx ingress-nginx-controller
```
