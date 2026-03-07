# Langfuse

LLM observability platform providing tracing, evaluation, and prompt management.

## Overview

Langfuse captures detailed traces of all LLM interactions through LiteLLM, enabling:
- Request/response tracing with latency breakdowns
- Cost tracking per request, user, and model
- Prompt management and versioning
- Model evaluation and scoring

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `observability` |
| Chart | `langfuse/langfuse` |
| Port | 3000 |
| Endpoint | `trace.jaimsnet.com` |
| Database | Managed PostgreSQL |

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.

## Operations

See [Langfuse Operations Runbook](../../docs/runbooks/langfuse-operations.md).
