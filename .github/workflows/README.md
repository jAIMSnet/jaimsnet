# GitHub Actions Workflows

This directory contains CI/CD workflow definitions for the jAIMSnet platform.

## Planned Workflows

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `ci.yaml` | Pull requests | Lint, validate, and test changes |
| `deploy.yaml` | Push to main | Deploy changes via Argo CD sync |
| `security-scan.yaml` | Schedule + PR | Run Trivy and security scans |
| `tofu-plan.yaml` | PR (iac/ changes) | Preview infrastructure changes |
| `tofu-apply.yaml` | Push to main (iac/) | Apply infrastructure changes |

## Configuration

Workflows require the following repository secrets:

- `DIGITALOCEAN_TOKEN` — DigitalOcean API token
- `KUBECONFIG` — Kubernetes cluster configuration
- `INFISICAL_TOKEN` — Infisical service token

## Status

🟡 Workflows are planned but not yet implemented. This README serves as documentation for the intended CI/CD pipeline.
