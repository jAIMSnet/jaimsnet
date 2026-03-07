# Ansible Inventory

Host inventory definitions for Ansible-managed infrastructure.

## Files

Inventory files define the hosts and groups that Ansible manages. Production inventory connects to DigitalOcean Droplets provisioned by OpenTofu.

## Groups

| Group | Hosts | Purpose |
|-------|-------|---------|
| `gpu_nodes` | GPU Droplets | vLLM model serving |
| `monitoring` | Monitoring Droplet | Uptime Kuma |
