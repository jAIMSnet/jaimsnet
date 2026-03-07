# Watchtower

Automatic container image updates for Docker Compose workloads.

## Overview

Watchtower monitors running containers on VM-based workloads and automatically pulls updated images. It is used for services running outside Kubernetes (GPU nodes, monitoring).

## Configuration

| Parameter | Value |
|-----------|-------|
| Deployment | Docker Compose on Droplets |
| Check Interval | 300 seconds |
| Cleanup | Enabled (remove old images) |

## Monitored Services

- vLLM on GPU Droplets
- Uptime Kuma on monitoring Droplet

## Deployment

Deployed alongside services via Ansible playbooks.
