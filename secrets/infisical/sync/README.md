# Infisical Sync Configurations

`InfisicalSecret` custom resource definitions that tell the operator which secrets to sync and where.

## Planned Sync Resources

| Resource | Source (Infisical) | Target (K8s Secret) | Namespace |
|----------|-------------------|---------------------|-----------|
| LiteLLM secrets | `/gateway/litellm` | `litellm-secrets` | `gateway` |
| Redis secrets | `/gateway/redis` | `redis-secrets` | `gateway` |
| Langfuse secrets | `/observability/langfuse` | `langfuse-secrets` | `observability` |
| Database credentials | `/databases` | `db-credentials` | Multiple |

## Configuration

Each sync resource specifies:
- Infisical project and environment
- Secret path in Infisical
- Target Kubernetes secret name and namespace
- Sync interval
