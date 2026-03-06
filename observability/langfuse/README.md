# Langfuse — LLM Observability

| Field | Value |
|-------|-------|
| **Namespace** | `observability` |
| **Helm Chart** | `langfuse/langfuse` |
| **Endpoint** | `https://langfuse.jAIMS.app` |
| **Status** | ⬜ TODO — Phase 1 deployment |
| **Last Updated** | 2026-03-06 |

## Overview

Langfuse captures every LLM request/response as a structured trace.
LiteLLM calls Langfuse as a callback on success and failure.

## Deploy

```bash
helm repo add langfuse https://langfuse.github.io/langfuse-k8s
helm upgrade --install langfuse langfuse/langfuse \
  --namespace observability --create-namespace \
  -f values.yaml
kubectl apply -f ingress.yaml
```

## Secrets Required

Synced by Infisical (see `secrets/infisical/sync/langfuse-secrets.yaml`):

| Secret Key | Purpose |
|-----------|---------|
| `LANGFUSE_DATABASE_URL` | PostgreSQL connection |
| `LANGFUSE_SALT` | Encryption salt |
| `LANGFUSE_PUBLIC_KEY` | API public key |
| `LANGFUSE_SECRET_KEY` | API secret key |
