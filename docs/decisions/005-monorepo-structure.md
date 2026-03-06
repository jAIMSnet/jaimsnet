# ADR-005: Monorepo Structure

| Field | Value |
|-------|-------|
| **Status** | Accepted |
| **Date** | 2026-03-06 |
| **Decision Makers** | @RMN |

## Context

jAIMSnet needs a repository structure that supports multiple deployment targets
(K8s, Docker Droplets, IaC) while remaining manageable for a small team.

## Decision

Use a **monorepo** structure at `github.com/jAIMSnet/jaimsnet` with logical
top-level directories per concern.

## Rationale

| Factor | Monorepo | Multiple Repos |
|--------|---------|---------------|
| Cross-service referencing | ✅ Easy | ❌ Complex |
| ArgoCD compatibility | ✅ Single source of truth | ❌ Requires multi-repo setup |
| Small team overhead | ✅ One PR for platform changes | ❌ Multiple PRs |
| Early-stage iteration | ✅ Fast changes | ❌ Slower |

## Consequences

- All infrastructure code lives in one place
- ArgoCD watches this single repo for K8s deployments
- Ansible playbooks reference observability configs directly
