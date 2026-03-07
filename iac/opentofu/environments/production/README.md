# Production Environment

OpenTofu configuration for the jAIMSnet production environment.

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with production values
tofu init
tofu plan
tofu apply
```

## Required Variables

See `terraform.tfvars.example` for all configurable variables.

## State

Remote state is stored in DigitalOcean Spaces.
