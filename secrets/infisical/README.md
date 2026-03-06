# Infisical — Secret Management

| Field | Value |
|-------|-------|
| **Provider** | Infisical Cloud Pro |
| **Project** | `jaims-net` |
| **Environment** | `production` |
| **Auth Method** | Kubernetes Auth (no secret-zero) |
| **Status** | ⬜ TODO — Phase 1 |
| **Last Updated** | 2026-03-06 |

## Overview

Infisical Kubernetes Operator syncs secrets from Infisical Cloud → native K8s Secrets.
No secrets are committed to this repository.

## Secrets Inventory

| Secret Key | Used By | Description |
|-----------|---------|-------------|
| `LITELLM_MASTER_KEY` | LiteLLM | Admin API key |
| `DATABASE_URL` | LiteLLM | PostgreSQL connection |
| `OPENAI_API_KEY` | LiteLLM | OpenAI routing |
| `ANTHROPIC_API_KEY` | LiteLLM | Anthropic routing |
| `GEMINI_API_KEY` | LiteLLM | Google Gemini routing |
| `REDIS_PASSWORD` | LiteLLM, Redis | Cache auth |
| `LANGFUSE_PUBLIC_KEY` | LiteLLM, Langfuse | Observability |
| `LANGFUSE_SECRET_KEY` | LiteLLM, Langfuse | Observability |
| `LANGFUSE_DATABASE_URL` | Langfuse | PostgreSQL connection |
| `LANGFUSE_SALT` | Langfuse | Encryption salt |

## Setup

### 1. Install Operator

```bash
helm repo add infisical https://dl.cloudsmith.io/public/infisical/helm-charts/helm/charts/
helm upgrade --install infisical-operator infisical/infisical-operator \
  --namespace infisical --create-namespace \
  -f operator/values.yaml
```

### 2. Configure Kubernetes Auth in Infisical

1. Go to Infisical Cloud → Project `jaims-net` → Settings → Access Control
2. Create a Machine Identity with Kubernetes Auth
3. Set the cluster endpoint and CA cert
4. Copy the Identity ID to `sync/*.yaml` files

### 3. Apply InfisicalSecret CRDs

```bash
kubectl apply -f sync/litellm-secrets.yaml
kubectl apply -f sync/langfuse-secrets.yaml
kubectl apply -f sync/redis-secrets.yaml
```

### 4. Verify Sync

```bash
kubectl get infisicalsecret -A
kubectl get secret litellm-secret -n gateway
kubectl get secret langfuse-secret -n observability
kubectl get secret redis-secret -n gateway
```

## How Secret Rotation Works

1. Update secret value in Infisical Cloud UI
2. Operator detects change within `resyncIntervalSeconds: 60`
3. K8s Secret is updated automatically
4. Pods pick up new value on next restart (or via volume mount refresh)
