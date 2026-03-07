# Argo CD Applications

Application manifests defining what Argo CD should deploy and manage.

## Planned Applications

| Application | Source | Namespace |
|-------------|--------|-----------|
| LiteLLM | `gateway/litellm/` | `gateway` |
| Redis | `gateway/redis/` | `gateway` |
| Langfuse | `observability/langfuse/` | `observability` |
| Prometheus Stack | `observability/prometheus/` | `observability` |
| Loki | `observability/loki/` | `observability` |
| Alloy | `observability/alloy/` | `observability` |
| Mimir | `observability/mimir/` | `observability` |
| Grafana | `observability/grafana/` | `observability` |
| ingress-nginx | `ingress/ingress-nginx/` | `ingress` |
| cert-manager | `ingress/cert-manager/` | `ingress` |
| Infisical Operator | `secrets/infisical/operator/` | `secrets` |
| Kyverno | `security/kyverno/` | `security` |
| Falco | `security/falco/` | `security` |
| Trivy | `security/trivy/` | `security` |
| CrowdSec | `security/crowdsec/` | `security` |

Each application manifest will reference the corresponding directory in this repository for its configuration source.
