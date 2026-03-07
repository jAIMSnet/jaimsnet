# Scaling Operations Runbook

## Horizontal Scaling

### LiteLLM Gateway
```bash
# Scale replicas
kubectl scale deployment litellm -n gateway --replicas=<count>

# Or update HPA
kubectl patch hpa litellm -n gateway -p '{"spec":{"maxReplicas":<count>}}'
```

### Langfuse
```bash
kubectl scale deployment langfuse -n observability --replicas=<count>
```

## Vertical Scaling

### Node Pool Scaling
```bash
# Add nodes via DigitalOcean
doctl kubernetes cluster node-pool update jaimsnet-production <pool-id> --count <count>
```

### GPU Nodes
GPU nodes are managed as separate Droplets via Ansible:
```bash
cd iac/ansible
ansible-playbook playbooks/scale-gpu.yaml -e "gpu_count=<count>"
```

## Database Scaling

Managed PostgreSQL scaling is done via DigitalOcean:
```bash
doctl databases resize <database-id> --size <new-size>
```

## Monitoring During Scaling

1. Watch pod scheduling: `kubectl get pods --all-namespaces -w`
2. Monitor node resources: `kubectl top nodes`
3. Check Grafana dashboards for service health
