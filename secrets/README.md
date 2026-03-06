# Secrets — Secret Management

| Field | Value |
|-------|-------|
| **Tool** | Infisical Kubernetes Operator |
| **Status** | ⬜ TODO — Phase 1 |
| **Last Updated** | 2026-03-06 |

## Overview

All secrets for jAIMSnet are managed through Infisical. No credentials are stored in Git.

The Infisical Kubernetes Operator syncs secrets from Infisical Cloud into native K8s Secrets,
which are then mounted into pods.

## Directory Structure

| Path | Purpose |
|------|---------|
| `infisical/operator/` | Helm values for Infisical Operator |
| `infisical/sync/` | InfisicalSecret CRD manifests (safe to commit — no actual secrets) |

## Quick Reference

```bash
# Check sync status
kubectl get infisicalsecret -A

# Verify a secret was synced
kubectl get secret litellm-secret -n gateway -o jsonpath='{.data}' | base64 -d
```

See `infisical/README.md` for full setup guide.
