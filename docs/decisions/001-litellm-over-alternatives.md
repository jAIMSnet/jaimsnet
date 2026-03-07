# ADR-001: LiteLLM Over Alternatives

## Status
Accepted

## Context
We need a unified API gateway for accessing multiple LLM providers (OpenAI, Anthropic, self-hosted models). Alternatives considered include direct API calls, custom proxy, and other gateway solutions.

## Decision
Use LiteLLM as the AI model gateway.

## Rationale
- Supports 100+ LLM providers through a unified OpenAI-compatible API
- Built-in API key management and virtual keys
- Cost tracking and budget controls per key/team
- Redis caching support for repeated queries
- Native Langfuse integration for observability
- Active open-source community with frequent updates
- Helm chart available for Kubernetes deployment

## Consequences
- Single point of entry for all AI model access
- Dependency on LiteLLM project maintenance
- Team must learn LiteLLM configuration and management
- Enables centralized cost tracking and access control
