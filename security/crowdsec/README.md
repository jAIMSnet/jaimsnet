# CrowdSec

Collaborative intrusion detection and prevention system.

## Overview

CrowdSec analyzes logs and network traffic to detect and block malicious behavior. It benefits from a community-driven threat intelligence database.

## Configuration

| Parameter | Value |
|-----------|-------|
| Namespace | `security` |
| Chart | `crowdsec/crowdsec` |
| Integration | ingress-nginx bouncer |

## Components

- **Agent**: Analyzes logs and detects threats
- **LAPI**: Local API for decision management
- **Bouncer**: Enforcement layer integrated with ingress-nginx

## Deployment

Managed via Argo CD. Helm values will be placed in this directory.
