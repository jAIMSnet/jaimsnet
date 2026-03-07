# Alloy

Grafana Alloy — unified OpenTelemetry collector for metrics, logs, and traces.

## Overview

Alloy replaces multiple collectors (Promtail, Prometheus exporters, OpenTelemetry Collector) with a single, configurable pipeline. It runs as a DaemonSet to collect data from all nodes.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `observability` |
| Chart | `grafana/alloy` |
| Mode | DaemonSet |

## Pipeline

```
Node Logs → Alloy → Loki
Node Metrics → Alloy → Prometheus / Mimir
App Traces → Alloy → (future trace backend)
```

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
