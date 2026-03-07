# Droplet Module

Creates DigitalOcean Droplets for workloads running outside Kubernetes (e.g., GPU nodes).

## Resources

- DigitalOcean Droplet
- Floating IP (optional)
- Firewall rules

## Inputs

| Variable | Description | Type |
|----------|-------------|------|
| `name` | Droplet name | string |
| `region` | DigitalOcean region | string |
| `size` | Droplet size | string |
| `image` | OS image | string |
| `vpc_uuid` | VPC to place Droplet in | string |
| `ssh_keys` | SSH key fingerprints | list(string) |
