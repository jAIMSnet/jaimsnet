# Infisical

Secret management platform with Kubernetes-native integration.

## Components

| Component | Purpose |
|-----------|---------|
| [operator/](operator/) | Infisical Kubernetes operator |
| [sync/](sync/) | InfisicalSecret sync configurations |

## How It Works

1. Secrets are stored in Infisical (cloud or self-hosted)
2. The Infisical operator watches for `InfisicalSecret` custom resources
3. Operator syncs secrets from Infisical to Kubernetes Secret objects
4. Applications reference standard Kubernetes secrets
