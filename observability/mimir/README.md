# Mimir

Grafana Mimir — horizontally scalable long-term metrics storage.

## Overview

Mimir provides long-term storage for Prometheus metrics, enabling queries across extended time ranges without impacting Prometheus performance.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `observability` |
| Chart | `grafana/mimir-distributed` |
| Storage | DigitalOcean Spaces (S3-compatible) |
| Retention | 1 year |

## Architecture

Prometheus remote-writes metrics to Mimir for long-term storage. Grafana queries both Prometheus (recent) and Mimir (historical) for complete time ranges.

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
