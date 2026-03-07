# ADR-006: Argo CD for GitOps

## Status
Accepted

## Context
We need a GitOps tool to manage Kubernetes deployments declaratively. Primary alternatives are Argo CD and Flux CD.

## Decision
Use Argo CD for GitOps continuous delivery.

## Rationale
- Mature project with strong community adoption (CNCF graduated)
- Web UI for deployment visualization and management
- Application-of-applications pattern for managing multiple services
- Supports Helm, Kustomize, and plain manifests
- Built-in RBAC and SSO integration
- Automatic sync with configurable policies
- Health checks and rollback capabilities

## Consequences
- Argo CD itself needs to be bootstrapped outside GitOps
- Additional resource overhead for Argo CD components
- Team must learn Argo CD application definitions
- Enables reliable, auditable deployments
