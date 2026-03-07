# Falco

Runtime threat detection through system call monitoring.

## Overview

Falco monitors system calls in real-time to detect anomalous behavior, such as unexpected process execution, file access, or network connections.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `security` |
| Chart | `falcosecurity/falco` |
| Mode | eBPF (kernel module-free) |

## Detection Rules

- Unexpected shell in container
- Sensitive file access (e.g., /etc/shadow)
- Outbound connections from unexpected processes
- Container privilege escalation

## Alerting

Alerts are forwarded to Grafana via Prometheus metrics and Loki log integration.

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
