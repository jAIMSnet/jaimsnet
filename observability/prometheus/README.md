# Prometheus — Infrastructure Metrics

| Field | Value |
|-------|-------|
| **Helm Chart** | `prometheus-community/kube-prometheus-stack` |
| **Namespace** | `observability` |
| **Status** | ⬜ Phase 2 |
| **Last Updated** | 2026-03-06 |

## Overview

Prometheus collects infrastructure-level metrics from the DOKS cluster.
Part of Phase 2 observability stack.

## Deploy (Phase 2)

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack \
  --namespace observability \
  -f values.yaml
```
