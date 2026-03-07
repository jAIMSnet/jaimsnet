# OpenTofu

Infrastructure provisioning for DigitalOcean resources using OpenTofu (Terraform-compatible).

## Structure

```
opentofu/
├── modules/              # Reusable infrastructure modules
│   ├── vpc/              # Virtual Private Cloud
│   ├── doks-cluster/     # DigitalOcean Kubernetes
│   ├── database/         # Managed PostgreSQL
│   ├── dns/              # DNS record management
│   └── droplet/          # Compute instances (GPU nodes)
└── environments/
    └── production/       # Production environment configuration
```

## Modules

| Module | Resources Created |
|--------|-------------------|
| `vpc` | VPC with private networking |
| `doks-cluster` | Managed Kubernetes cluster with node pools |
| `database` | Managed PostgreSQL for Langfuse and LiteLLM |
| `dns` | DNS records for all service endpoints |
| `droplet` | GPU Droplets for vLLM inference |

## Usage

```bash
cd environments/production
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars
tofu init
tofu plan
tofu apply
```

## State Management

OpenTofu state is stored remotely using DigitalOcean Spaces as the backend.
