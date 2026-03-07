# Compliance Evidence

Evidence collection automation and templates for compliance audits.

## Overview

This directory contains tooling and templates for collecting evidence that demonstrates compliance with applicable frameworks.

## Evidence Types

| Type | Source | Method |
|------|--------|--------|
| Access logs | Kubernetes audit logs | Automated export |
| Vulnerability scans | Trivy reports | CI/CD pipeline |
| Configuration audits | kube-bench, docker-bench | Scheduled jobs |
| Secret access logs | Infisical audit trail | API export |
| Deployment history | Argo CD, Git history | Automated collection |
| Uptime reports | Uptime Kuma | Scheduled export |

## Status

🟡 Evidence collection automation is planned. Templates will be added as compliance frameworks are mapped.
