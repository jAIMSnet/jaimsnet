# vLLM

High-throughput LLM inference engine for self-hosted model serving.

## Overview

vLLM provides fast model inference with an OpenAI-compatible API. It runs on dedicated GPU Droplets and is registered as a model provider in LiteLLM.

## Configuration

| Parameter | Value |
|-----------|-------|
| Deployment | Docker Compose on GPU Droplet |
| API Port | 8000 |
| GPU | NVIDIA (configured via Ansible) |

## Features

- PagedAttention for efficient memory management
- Continuous batching for high throughput
- OpenAI-compatible API (drop-in for LiteLLM)
- Support for popular open-source models

## Deployment

Deployed via Ansible on GPU Droplets. See [iac/ansible/](../../iac/ansible/) for provisioning.

## Integration with LiteLLM

vLLM is registered as a model provider in LiteLLM configuration, enabling the gateway to route requests to self-hosted models alongside commercial providers.
