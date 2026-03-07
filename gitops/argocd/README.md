# Argo CD

GitOps continuous delivery for Kubernetes deployments.

## Overview

Argo CD manages all Kubernetes application deployments by watching this repository and syncing desired state to the cluster.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `argocd` |
| Chart | `argo/argo-cd` |
| Sync Policy | Automated with self-heal |
| Prune | Enabled |

## Structure

```
argocd/
└── applications/     # Argo CD Application manifests
```

## Application-of-Applications Pattern

A root Application watches the `applications/` directory and creates child Applications for each service. This enables managing all deployments from a single entry point.

## Deployment

Argo CD itself is bootstrapped via Helm (see [Deployment Guide](../../docs/deployment-guide.md)).
