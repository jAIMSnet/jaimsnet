# Ansible

Configuration management for VM-based workloads in the jAIMSnet platform.

## Structure

```
ansible/
├── inventory/        # Host inventory definitions
├── playbooks/        # Ansible playbooks
└── roles/            # Reusable Ansible roles
```

## Components

| Directory | Purpose |
|-----------|---------|
| [inventory/](inventory/) | Host and group definitions |
| [playbooks/](playbooks/) | Task automation playbooks |
| [roles/](roles/) | Reusable configuration roles |

## Usage

```bash
ansible-playbook -i inventory/production.yaml playbooks/<playbook>.yaml
```

## Managed Hosts

- GPU Droplets (vLLM inference)
- Monitoring Droplet (Uptime Kuma)
