# LiteLLM Operations Runbook

## Health Check

```bash
curl https://api.jaimsnet.com/health
kubectl get pods -n gateway -l app=litellm
```

## Common Issues

### High Latency
1. Check Redis cache hit rate in Grafana
2. Review provider response times in Langfuse
3. Check pod resource utilization: `kubectl top pods -n gateway`
4. Scale replicas if needed: `kubectl scale deployment litellm -n gateway --replicas=3`

### API Key Issues
1. Check LiteLLM admin UI for key status
2. Verify Infisical secret sync: `kubectl get infisicalsecrets -n gateway`
3. Review key budget limits in LiteLLM configuration

### Provider Failures
1. Check provider status pages
2. Review error rates in Langfuse traces
3. LiteLLM automatically falls back to configured backup providers
4. Manually disable failing provider via LiteLLM admin API if needed

## Restart Procedure

```bash
kubectl rollout restart deployment litellm -n gateway
kubectl rollout status deployment litellm -n gateway
```
