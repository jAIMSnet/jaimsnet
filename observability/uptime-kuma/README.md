# Uptime Kuma — Endpoint Health Monitoring

| Field | Value |
|-------|-------|
| **Deployment** | Docker Compose on Droplet |
| **Droplet** | 1vCPU / 1GiB ($6/mo) |
| **Endpoint** | `https://kuma.jAIMS.app` |
| **Port** | `3001` |
| **Status** | ⬜ TODO — Phase 1 deployment |
| **Last Updated** | 2026-03-06 |

## Overview

Uptime Kuma monitors endpoint health for all jAIMSnet services.
It runs on a separate lightweight Droplet to provide independent health monitoring.

## Monitored Endpoints

| Endpoint | Type | Status |
|----------|------|--------|
| `https://litellm.jAIMS.app/health` | HTTP | ⬜ Pending setup |
| `https://langfuse.jAIMS.app` | HTTP | ⬜ Pending setup |
| DOKS cluster API | TCP | ⬜ Pending setup |
| DO Managed PostgreSQL | TCP | ⬜ Pending setup |

## Deploy

This runs on a Droplet, not Kubernetes. Managed via Ansible.

```bash
# See iac/ansible/playbooks/deploy-uptime-kuma.yaml
ansible-playbook -i iac/ansible/inventory/production.yaml \
  iac/ansible/playbooks/deploy-uptime-kuma.yaml
```
