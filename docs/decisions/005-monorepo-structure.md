# ADR-005: Monorepo Structure

## Status
Accepted

## Context
We need to decide between a monorepo or multi-repo approach for managing infrastructure, configuration, and documentation.

## Decision
Use a monorepo structure with all platform components in a single repository.

## Rationale
- Single source of truth for all platform configuration
- Atomic changes across multiple components
- Simplified code review and change tracking
- Easier onboarding for new team members
- Consistent tooling and CI/CD across all components
- GitOps-friendly with Argo CD watching a single repo

## Consequences
- Repository size will grow over time
- Need clear directory structure and ownership (CODEOWNERS)
- CI/CD pipelines need path-based filtering
- All team members have visibility into all components
