# ADR-003: DOKS Over Plain Droplets

## Status
Accepted

## Context
We need to choose between DigitalOcean Managed Kubernetes (DOKS) and self-managed Kubernetes on Droplets for running our platform services.

## Decision
Use DigitalOcean Managed Kubernetes (DOKS).

## Rationale
- Managed control plane reduces operational overhead
- Automatic Kubernetes version upgrades
- Integrated with DigitalOcean load balancers and volumes
- Cost-effective compared to EKS/GKE/AKS
- Node pool management with auto-scaling
- Native support through OpenTofu DigitalOcean provider

## Consequences
- Dependent on DigitalOcean's Kubernetes version support timeline
- Limited to DigitalOcean regions
- Control plane is managed (less customization)
- Reduced ops burden for Kubernetes maintenance
- GPU nodes added as separate Droplets outside DOKS
