# DOKS Cluster Module

Creates a DigitalOcean Managed Kubernetes (DOKS) cluster.

## Resources

- DOKS cluster
- Default node pool
- Additional node pools (optional)

## Inputs

| Variable | Description | Type |
|----------|-------------|------|
| `name` | Cluster name | string |
| `region` | DigitalOcean region | string |
| `version` | Kubernetes version | string |
| `vpc_uuid` | VPC to place cluster in | string |
| `node_size` | Droplet size for nodes | string |
| `node_count` | Number of nodes | number |
