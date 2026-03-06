# cert-manager — TLS Automation

| Field | Value |
|-------|-------|
| **Helm Chart** | `jetstack/cert-manager` |
| **Version** | `v1.19.4` |
| **Namespace** | `cert-manager` |
| **Issuer** | `letsencrypt-prod` (see `cluster/cluster-issuer.yaml`) |
| **Status** | ✅ Deployed |
| **Last Updated** | 2026-03-06 |

## Deploy

```bash
helm repo add jetstack https://charts.jetstack.io
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager --create-namespace \
  -f values.yaml
```

## Verify

```bash
kubectl get pods -n cert-manager
kubectl get clusterissuer letsencrypt-prod
```
