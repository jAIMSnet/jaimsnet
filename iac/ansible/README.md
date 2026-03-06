# Ansible — Configuration Management

| Field | Value |
|-------|-------|
| **Tool** | Ansible |
| **Target** | Docker Droplets (not K8s) |
| **Status** | ⬜ Phase 3 |
| **Last Updated** | 2026-03-06 |

## Overview

Ansible manages configuration of Docker Droplets — AnythingLLM instances, Uptime Kuma Droplet,
system packages, firewall rules.

| Target | Tool | Purpose |
|--------|------|---------|
| K8s cluster | Helm / ArgoCD | App deployment |
| Docker Droplets | Ansible | System config, Docker, firewall |
| Docker images | Watchtower | Auto-update containers |
