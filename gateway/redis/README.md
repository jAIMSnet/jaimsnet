# Redis

Redis cache backend for the LiteLLM gateway.

## Overview

Redis provides caching for LiteLLM to reduce latency and costs for repeated or similar queries.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `gateway` |
| Chart | `bitnami/redis` |
| Port | 6379 |
| Persistence | Enabled |

## Cache Strategy

- **Exact match caching**: Cache responses for identical requests
- **Semantic caching**: Cache responses for semantically similar requests (configurable)
- **TTL**: Configurable per-model time-to-live

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
