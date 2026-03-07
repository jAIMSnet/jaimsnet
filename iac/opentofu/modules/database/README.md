# Database Module

Creates a DigitalOcean Managed PostgreSQL database.

## Resources

- Managed PostgreSQL cluster
- Database users
- Database instances

## Inputs

| Variable | Description | Type |
|----------|-------------|------|
| `name` | Database cluster name | string |
| `region` | DigitalOcean region | string |
| `size` | Database Droplet size | string |
| `node_count` | Number of database nodes | number |
| `vpc_uuid` | VPC to place database in | string |
