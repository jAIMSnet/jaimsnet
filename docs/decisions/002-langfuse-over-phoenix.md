# ADR-002: Langfuse Over Phoenix

## Status
Accepted

## Context
We need LLM observability tooling for tracing, evaluation, and prompt management. Primary alternatives are Langfuse and Arize Phoenix.

## Decision
Use Langfuse for LLM observability.

## Rationale
- Self-hostable with full data control
- Native integration with LiteLLM
- Comprehensive tracing with nested spans
- Built-in prompt management and versioning
- Evaluation framework for model quality
- PostgreSQL-backed (aligns with existing database choice)
- Active development with frequent releases

## Consequences
- Requires PostgreSQL database (shared with other services)
- Self-hosting means we manage upgrades and availability
- Team gains full visibility into LLM usage patterns
- Enables data-driven prompt optimization
