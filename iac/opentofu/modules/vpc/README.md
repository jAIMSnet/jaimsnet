# VPC Module

Creates a DigitalOcean VPC with private networking for the jAIMSnet platform.

## Resources

- DigitalOcean VPC
- IP range configuration

## Inputs

| Variable | Description | Type |
|----------|-------------|------|
| `name` | VPC name | string |
| `region` | DigitalOcean region | string |
| `ip_range` | Private IP CIDR range | string |
