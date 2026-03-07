# Kyverno

Kubernetes-native policy engine for admission control and resource validation.

## Overview

Kyverno enforces security policies on all Kubernetes resources through admission webhooks. Policies are defined as Kubernetes custom resources.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `security` |
| Chart | `kyverno/kyverno` |

## Policies

See [policies/](policies/) for all policy definitions.

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
