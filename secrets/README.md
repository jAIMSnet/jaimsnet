# Secrets Management

Centralized secret management for the jAIMSnet platform using Infisical.

## Components

| Component | Purpose |
|-----------|---------|
| [infisical/](infisical/) | Infisical operator and sync configurations |

## Architecture

Secrets are stored in Infisical and synced to Kubernetes via the Infisical operator. This provides centralized management, audit logging, and automatic rotation.

## Secret Categories

| Category | Examples | Namespace |
|----------|----------|-----------|
| LLM API Keys | OpenAI, Anthropic keys | `gateway` |
| Database Credentials | PostgreSQL connection strings | `gateway`, `observability` |
| Infra Credentials | DigitalOcean tokens | `argocd` |
| TLS Certificates | Managed by cert-manager | `ingress` |
