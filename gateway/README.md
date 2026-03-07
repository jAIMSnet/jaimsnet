# Gateway

AI gateway layer providing unified LLM access for the jAIMSnet platform.

## Components

| Component | Purpose |
|-----------|---------|
| [litellm/](litellm/) | LiteLLM AI model gateway |
| [redis/](redis/) | Redis cache for LiteLLM |

## Architecture

LiteLLM serves as the central gateway for all AI/LLM API access. It provides a unified OpenAI-compatible API that routes to multiple providers. Redis provides caching to reduce costs and latency for repeated queries.

```
Client → ingress-nginx → LiteLLM → Model Providers
                            ↓              (OpenAI, Anthropic, vLLM)
                          Redis (cache)
                            ↓
                         Langfuse (tracing)
```
