# Infisical Operator

| Field | Value |
|-------|-------|
| **Helm Chart** | `infisical/infisical-operator` |
| **Namespace** | `infisical` |
| **Auth Method** | Kubernetes Auth (no secret-zero) |
| **Status** | ⬜ TODO — Phase 1 |
| **Last Updated** | 2026-03-06 |

## Deploy

```bash
helm repo add infisical https://dl.cloudsmith.io/public/infisical/helm-charts/helm/charts/
helm upgrade --install infisical-operator infisical/infisical-operator \
  --namespace infisical --create-namespace \
  -f values.yaml
```
