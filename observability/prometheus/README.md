# Prometheus

Metrics collection and alerting for Kubernetes infrastructure and applications.

## Overview

Prometheus scrapes metrics from all platform components and provides alerting rules. It uses service discovery to automatically find scrape targets in the cluster.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `observability` |
| Chart | `prometheus-community/kube-prometheus-stack` |
| Retention | 15 days (local), long-term via Mimir |
| Port | 9090 |

## Key Metrics

- Kubernetes node and pod resource utilization
- LiteLLM request rates, latencies, and error rates
- Ingress controller traffic metrics
- Database connection pool metrics

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
