# GPU Workloads

GPU-accelerated workloads for self-hosted model inference.

## Components

| Component | Purpose |
|-----------|---------|
| [vllm/](vllm/) | vLLM model serving engine |

## Architecture

GPU workloads run on dedicated DigitalOcean GPU Droplets managed outside of DOKS. vLLM provides high-throughput model inference with OpenAI-compatible API, allowing LiteLLM to route requests to self-hosted models.
