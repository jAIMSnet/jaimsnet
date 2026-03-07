# Ingress

Traffic ingress and TLS management for the jAIMSnet platform.

## Components

| Component | Purpose |
|-----------|---------|
| [ingress-nginx](ingress-nginx/) | Kubernetes ingress controller |
| [cert-manager](cert-manager/) | Automated TLS certificate management |

## Architecture

External traffic flows through ingress-nginx, which terminates TLS using certificates managed by cert-manager. cert-manager uses Let's Encrypt for automated certificate issuance and renewal.
