# Gateway — AI Gateway Stack

| Field | Value |
|-------|-------|
| **Components** | LiteLLM, Redis |
| **Namespace** | `gateway` |
| **Status** | ⬜ TODO — Phase 1 deployment |
| **Last Updated** | 2026-03-06 |

## Architecture

```
Internet ──► ingress-nginx ──► litellm.jAIMS.app
                                    │
                              LiteLLM Proxy
                              (AI Gateway)
                                    │
                    ┌───────────────┴──────────────┐
                    │                              │
                 Redis Cache              Provider APIs
                 (caching)           (OpenAI, Anthropic, etc.)
                    │
                Langfuse
              (observability)
```

## Components

| Component | Directory | Purpose | Status |
|-----------|-----------|---------|--------|
| LiteLLM | `litellm/` | AI gateway / model router | ⬜ TODO |
| Redis | `redis/` | Response caching | ⬜ TODO |

## Secrets

All credentials are managed by the Infisical operator.
See `secrets/infisical/sync/` for InfisicalSecret CRDs.
