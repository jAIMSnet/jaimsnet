# Loki

Log aggregation system for the jAIMSnet platform.

## Overview

Loki collects and indexes logs from all Kubernetes workloads. It uses a label-based approach (similar to Prometheus) for efficient log indexing and querying via LogQL.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `observability` |
| Chart | `grafana/loki` |
| Storage | DigitalOcean Spaces (S3-compatible) |
| Retention | 30 days |

## Log Collection

Logs are collected by Alloy (running as DaemonSet) and forwarded to Loki.

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
