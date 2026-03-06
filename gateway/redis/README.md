# Redis — Response Cache

| Field | Value |
|-------|-------|
| **Namespace** | `gateway` |
| **Helm Chart** | `bitnami/redis` |
| **Mode** | Standalone |
| **Status** | ⬜ TODO — Phase 1 deployment |
| **Last Updated** | 2026-03-06 |

## Overview

Redis provides response caching for LiteLLM. Reduces latency and provider API costs
by caching identical or semantically similar requests.

## Deploy

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install redis bitnami/redis \
  --namespace gateway --create-namespace \
  -f values.yaml
```

## Secrets Required

Synced by Infisical (see `secrets/infisical/sync/redis-secrets.yaml`):

| Secret Key | Purpose |
|-----------|---------|
| `REDIS_PASSWORD` | Redis auth password |
