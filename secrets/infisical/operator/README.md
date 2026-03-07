# Infisical Operator

Kubernetes operator that syncs secrets from Infisical into Kubernetes Secret objects.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `secrets` |
| Chart | `infisical/secrets-operator` |
| Sync Interval | 60 seconds |

## Deployment

Deployed via Helm through Argo CD. Helm values will be placed in this directory.

## Operations

See [Secret Rotation Runbook](../../../docs/runbooks/secret-rotation.md) for operational procedures.
