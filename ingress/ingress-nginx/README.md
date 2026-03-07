# ingress-nginx

NGINX-based Kubernetes ingress controller.

## Overview

ingress-nginx handles all external HTTP/HTTPS traffic routing to internal services. It runs in the `ingress` namespace and is deployed via Helm through Argo CD.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `ingress` |
| Chart | `ingress-nginx/ingress-nginx` |
| Load Balancer | DigitalOcean LB (auto-provisioned) |
| TLS | Terminated at ingress (via cert-manager) |

## Ingress Routes

| Host | Service | Namespace |
|------|---------|-----------|
| `api.jaimsnet.com` | LiteLLM | `gateway` |
| `trace.jaimsnet.com` | Langfuse | `observability` |
| `grafana.jaimsnet.com` | Grafana | `observability` |
| `status.jaimsnet.com` | Uptime Kuma | `observability` |

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
