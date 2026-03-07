# ADR-004: Infisical for Secret Management

## Status
Accepted

## Context
We need a secret management solution that integrates with Kubernetes and provides audit logging, rotation, and centralized management. Alternatives include HashiCorp Vault, Sealed Secrets, and External Secrets Operator.

## Decision
Use Infisical with the Kubernetes operator for secret management.

## Rationale
- Purpose-built for cloud-native secret management
- Kubernetes operator for automatic secret syncing
- Web UI for secret management by non-technical team members
- Audit logging for compliance requirements
- Automatic secret rotation support
- Environment-based scoping (dev, staging, production)
- Lower operational complexity than HashiCorp Vault

## Consequences
- Dependency on Infisical cloud or self-hosted instance
- Team must manage Infisical operator lifecycle
- All secrets centralized in one platform
- Simplified secret management workflow for developers
