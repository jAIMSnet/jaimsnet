# Langfuse Operations Runbook

## Health Check

```bash
curl https://trace.jaimsnet.com/api/public/health
kubectl get pods -n observability -l app=langfuse
```

## Common Issues

### Database Connection Errors
1. Check PostgreSQL status: `kubectl get pods -n databases -l app=postgresql`
2. Verify connection string in Infisical
3. Check database disk space and connections

### High Memory Usage
1. Check pod metrics: `kubectl top pods -n observability -l app=langfuse`
2. Review trace ingestion rate in Grafana
3. Consider increasing resource limits or adding replicas

### Trace Data Retention
1. Langfuse stores traces in PostgreSQL
2. Configure retention via Langfuse environment variables
3. Monitor database size growth in Grafana

## Backup

```bash
# Database backup is handled by managed PostgreSQL
# Additional manual backup if needed:
pg_dump -h <host> -U langfuse langfuse > langfuse_backup.sql
```
