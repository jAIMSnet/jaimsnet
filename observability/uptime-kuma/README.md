# Uptime Kuma

Self-hosted uptime monitoring and status page.

## Overview

Uptime Kuma provides external availability monitoring for all public-facing jAIMSnet services and serves as the public status page.

## Configuration

| Parameter | Value |
|-----------|-------|
| Deployment | Docker Compose on Droplet |
| Port | 3001 |
| Endpoint | `status.jaimsnet.com` |

## Monitored Endpoints

| Endpoint | Check Type | Interval |
|----------|-----------|----------|
| `api.jaimsnet.com/health` | HTTP | 60s |
| `trace.jaimsnet.com` | HTTP | 60s |
| `grafana.jaimsnet.com` | HTTP | 60s |
| Kubernetes API | TCP | 120s |

## Deployment

Deployed via Ansible on a dedicated Droplet (separate from DOKS for independent monitoring). See [iac/ansible/](../../iac/ansible/).
