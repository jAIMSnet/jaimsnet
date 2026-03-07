# Grafana

Visualization and dashboarding platform for metrics, logs, and traces.

## Overview

Grafana provides unified dashboards for all observability data sources including Prometheus, Loki, and Mimir.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `observability` |
| Chart | Part of `kube-prometheus-stack` |
| Port | 3001 |
| Endpoint | `grafana.jaimsnet.com` |

## Data Sources

| Source | Type | Purpose |
|--------|------|---------|
| Prometheus | Metrics | Real-time metrics |
| Loki | Logs | Log querying |
| Mimir | Metrics | Long-term metrics |

## Planned Dashboards

- Kubernetes cluster overview
- LiteLLM gateway performance
- Langfuse trace analytics
- Security alerts overview
- Cost tracking dashboard

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
