# DNS Module

Manages DNS records for the jAIMSnet platform.

## Resources

- DigitalOcean domain
- A/CNAME records for services

## Records

| Record | Type | Target |
|--------|------|--------|
| `api.jaimsnet.com` | A | Load Balancer IP |
| `trace.jaimsnet.com` | A | Load Balancer IP |
| `grafana.jaimsnet.com` | A | Load Balancer IP |
| `status.jaimsnet.com` | A | Droplet IP |
