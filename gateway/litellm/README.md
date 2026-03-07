# LiteLLM

Unified AI model gateway providing OpenAI-compatible API access to multiple LLM providers.

## Overview

LiteLLM acts as a proxy that provides a single API endpoint for accessing multiple LLM providers. It handles key management, rate limiting, cost tracking, and request logging.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `gateway` |
| Chart | `litellm/litellm` |
| Port | 4000 |
| Endpoint | `api.jaimsnet.com` |

## Features

- **Unified API**: OpenAI-compatible API for all providers
- **Key Management**: Virtual API keys with per-key budgets
- **Cost Tracking**: Real-time cost monitoring per key/team
- **Caching**: Redis-backed semantic and exact match caching
- **Fallbacks**: Automatic failover between model providers
- **Logging**: Request/response logging to Langfuse

## Model Providers

| Provider | Models | Priority |
|----------|--------|----------|
| OpenAI | GPT-4, GPT-3.5 | Primary |
| Anthropic | Claude 3.5, Claude 3 | Primary |
| vLLM (self-hosted) | Open-source models | Secondary |

## Deployment

Managed via Argo CD. Helm values and configuration files will be placed in this directory.

## Operations

See [LiteLLM Operations Runbook](../../docs/runbooks/litellm-operations.md).
