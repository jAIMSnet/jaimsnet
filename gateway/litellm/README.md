# LiteLLM — AI Gateway

| Field | Value |
|-------|-------|
| **Namespace** | `gateway` |
| **Helm Chart** | `litellm/litellm` |
| **Endpoint** | `https://litellm.jAIMS.app` |
| **Status** | ⬜ TODO — Phase 1 deployment |
| **Last Updated** | 2026-03-06 |

## Overview

LiteLLM Proxy is the core AI gateway for jAIMSnet. It exposes an OpenAI-compatible API
and routes requests to multiple model providers via named aliases.

## Model Aliases

| Alias | Purpose | Status |
|-------|---------|--------|
| `smart` | Highest quality, complex tasks | ⬜ TBD |
| `fast` | Low latency, lightweight tasks | ⬜ TBD |
| `code` | Code generation and analysis | ⬜ TBD |
| `reason` | Complex reasoning | ⬜ TBD |
| `long` | Long context window | ⬜ TBD |
| `complex` | Multi-step agentic tasks | ⬜ TBD |
| `budget` | Cost-optimized | ⬜ TBD |
| `embed` | Text embeddings | ⬜ TBD |

## Files

| File | Purpose |
|------|---------|
| `values.yaml` | Helm chart values |
| `config.yaml` | Model routing config (mounts as ConfigMap) |
| `ingress.yaml` | Kubernetes Ingress for litellm.jAIMS.app |

## Deploy

```bash
# Install LiteLLM
helm repo add litellm https://helm.litellm.ai
helm upgrade --install litellm litellm/litellm \
  --namespace gateway --create-namespace \
  -f values.yaml

# Apply ingress
kubectl apply -f ingress.yaml
```

## Secrets Required

Secrets synced by Infisical (see `secrets/infisical/sync/litellm-secrets.yaml`):

| Secret Key | Purpose |
|-----------|---------|
| `LITELLM_MASTER_KEY` | LiteLLM admin key |
| `DATABASE_URL` | PostgreSQL connection string |
| `OPENAI_API_KEY` | OpenAI routing |
| `ANTHROPIC_API_KEY` | Anthropic routing |
| `GEMINI_API_KEY` | Google Gemini routing |
| `REDIS_PASSWORD` | Redis cache connection |
| `LANGFUSE_PUBLIC_KEY` | Langfuse callback |
| `LANGFUSE_SECRET_KEY` | Langfuse callback |
