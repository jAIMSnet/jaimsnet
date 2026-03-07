# cert-manager

Automated TLS certificate management using Let's Encrypt.

## Overview

cert-manager runs in the `ingress` namespace and automatically provisions and renews TLS certificates for all ingress resources.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `ingress` |
| Chart | `jetstack/cert-manager` |
| Issuer | Let's Encrypt (production + staging) |
| Challenge | HTTP-01 via ingress-nginx |

## Certificate Issuers

- **Production**: Let's Encrypt production (rate-limited)
- **Staging**: Let's Encrypt staging (for testing)

## Operations

See [Certificate Renewal Runbook](../../docs/runbooks/certificate-renewal.md) for operational procedures.
