# Trivy

Container vulnerability scanning for the jAIMSnet platform.

## Overview

Trivy scans container images for known vulnerabilities, misconfigurations, and exposed secrets. It integrates with CI/CD pipelines and can run as an operator in the cluster.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `security` |
| Chart | `aqua/trivy-operator` |
| Scan Types | Vulnerability, misconfiguration, secret |

## Integration Points

- **CI/CD**: Scan images before deployment
- **Cluster**: Trivy Operator continuously scans running workloads
- **Reports**: Results visible in Grafana dashboards

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
