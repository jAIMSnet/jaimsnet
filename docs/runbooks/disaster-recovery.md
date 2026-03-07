# Disaster Recovery Runbook

## Recovery Time Objectives

| Component | RTO | RPO |
|-----------|-----|-----|
| AI Gateway (LiteLLM) | 15 min | 0 (stateless) |
| Observability (Langfuse) | 1 hour | 1 hour |
| Kubernetes Cluster | 2 hours | N/A (declarative) |
| Database | 1 hour | 5 min (continuous backup) |

## Scenario: Cluster Failure

### Full Cluster Recreation
1. Provision new cluster via OpenTofu:
   ```bash
   cd iac/opentofu/environments/production
   tofu apply
   ```
2. Bootstrap Argo CD
3. Argo CD syncs all applications from this repository
4. Verify all services are healthy

### Partial Node Failure
1. DOKS auto-heals node pool members
2. Monitor: `kubectl get nodes`
3. If auto-heal fails, manually recycle: `doctl kubernetes cluster node-pool recycle`

## Scenario: Database Failure

1. DigitalOcean managed databases provide automatic failover
2. Verify connectivity from application pods
3. If restoration needed, use managed database backups:
   ```bash
   doctl databases backups list <database-id>
   doctl databases backups restore <database-id> <backup-id>
   ```

## Scenario: DNS / Ingress Failure

1. Check ingress-nginx controller: `kubectl get pods -n ingress`
2. Verify DNS records: `dig api.jaimsnet.com`
3. Check cert-manager certificates: `kubectl get certificates -n ingress`
4. Restart ingress if needed: `kubectl rollout restart deployment ingress-nginx-controller -n ingress`

## Communication

During any incident:
1. Update status page (Uptime Kuma)
2. Notify team via designated communication channel
3. Document timeline and actions taken
4. Conduct post-incident review
