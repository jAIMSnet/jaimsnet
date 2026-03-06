# Runbook: Secret Rotation

| Field | Value |
|-------|-------|
| **Last Updated** | 2026-03-06 |
| **Owner** | @SHD |
| **Status** | ⬜ TODO — populate during Phase 1 |

## Overview

All jAIMSnet secrets are managed in Infisical Cloud. Rotation is performed in Infisical
and automatically synced to K8s Secrets by the Infisical Operator.

## Rotation Procedure

### 1. Rotate in Infisical

1. Log in to Infisical Cloud → Project `jaims-net` → Environment `production`
2. Find the secret to rotate
3. Update the value
4. Infisical Operator syncs within `resyncIntervalSeconds: 60`

### 2. Restart Affected Pods (if needed)

Some secrets require a pod restart to take effect:

```bash
# Restart LiteLLM
kubectl rollout restart deployment/litellm -n gateway

# Restart Langfuse
kubectl rollout restart deployment/langfuse -n observability
```

### 3. Verify

```bash
# Verify secret was synced
kubectl get secret litellm-secret -n gateway

# Check LiteLLM health
curl https://litellm.jAIMS.app/health
```

## Secrets Inventory

| Secret | Rotation Frequency | Requires Pod Restart |
|--------|-------------------|---------------------|
| `LITELLM_MASTER_KEY` | Quarterly | ✅ Yes |
| `DATABASE_URL` | On compromise | ✅ Yes |
| `OPENAI_API_KEY` | On compromise | ✅ Yes |
| `ANTHROPIC_API_KEY` | On compromise | ✅ Yes |
| `GEMINI_API_KEY` | On compromise | ✅ Yes |
| `REDIS_PASSWORD` | Quarterly | ✅ Yes |
| `LANGFUSE_PUBLIC_KEY` | Quarterly | ✅ Yes |
| `LANGFUSE_SECRET_KEY` | Quarterly | ✅ Yes |
| `LANGFUSE_DATABASE_URL` | On compromise | ✅ Yes |
| `LANGFUSE_SALT` | Never (breaking change) | N/A |
