# Cluster Configuration

Kubernetes cluster-level configurations for the jAIMSnet platform.

## Contents

- [namespaces.md](namespaces.md) — Namespace definitions and strategy
- [network-policies.md](network-policies.md) — Network policy documentation

## Cluster Details

| Property | Value |
|----------|-------|
| Provider | DigitalOcean DOKS |
| Version | 1.28+ |
| Region | Configured via OpenTofu |
| Node Pools | General purpose + optional GPU |

## Management

Cluster infrastructure is provisioned via OpenTofu (see [iac/opentofu/](../iac/opentofu/)).
Application deployments are managed via Argo CD (see [gitops/argocd/](../gitops/argocd/)).
