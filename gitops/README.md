# GitOps

GitOps tooling for automated deployments and image updates.

## Components

| Component | Purpose |
|-----------|---------|
| [argocd/](argocd/) | Argo CD application definitions |
| [watchtower/](watchtower/) | Container image auto-updates |

## Strategy

Argo CD watches this repository and automatically syncs Kubernetes resources. Changes merged to `main` are automatically deployed to the cluster.

Watchtower monitors container registries for image updates on VM-based workloads (outside Kubernetes).
