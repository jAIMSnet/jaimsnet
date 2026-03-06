# vLLM — GPU Inference

| Field | Value |
|-------|-------|
| **GPU** | AMD MI300X |
| **Framework** | vLLM |
| **Deployment** | Docker Compose on GPU Droplet |
| **Status** | ⬜ Phase 2 |
| **Last Updated** | 2026-03-06 |

## Overview

vLLM provides self-hosted GPU inference on an AMD MI300X Droplet.
Once deployed, LiteLLM will route to it as an additional backend.

## Files

| File | Purpose |
|------|---------|
| `docker-compose.yaml` | vLLM service definition |
| `gpu-health.sh` | GPU health monitoring script |
