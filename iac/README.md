# Infrastructure as Code

Infrastructure provisioning and configuration management for the jAIMSnet platform.

## Components

| Component | Purpose |
|-----------|---------|
| [opentofu/](opentofu/) | Cloud infrastructure provisioning (DigitalOcean) |
| [ansible/](ansible/) | Configuration management for VM-based workloads |

## Architecture

OpenTofu provisions cloud resources (VPC, Kubernetes cluster, databases, DNS). Ansible configures VM-based workloads that run outside Kubernetes (GPU nodes, monitoring).
