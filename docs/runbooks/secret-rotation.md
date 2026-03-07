# Secret Rotation Runbook

## Automated Rotation (Infisical)

Infisical handles automatic rotation for configured secrets. Verify rotation status:

```bash
kubectl get infisicalsecrets --all-namespaces
kubectl describe infisicalsecret <name> -n <namespace>
```

## Manual Rotation Procedures

### LLM Provider API Keys
1. Generate new key in provider dashboard (OpenAI, Anthropic, etc.)
2. Update key in Infisical under the appropriate environment
3. Infisical operator syncs the new key to Kubernetes secrets
4. Verify LiteLLM picks up new key: check health endpoint and test a request

### Database Credentials
1. Update credentials in managed database provider
2. Update corresponding secret in Infisical
3. Restart affected services to pick up new credentials
4. Verify connectivity

### TLS Certificates
cert-manager handles automatic renewal. For manual intervention:
```bash
kubectl get certificates --all-namespaces
kubectl describe certificate <name> -n <namespace>
# Force renewal
kubectl delete secret <tls-secret-name> -n <namespace>
```

## Verification

After any rotation, verify:
1. All affected services are healthy
2. No authentication errors in logs
3. Langfuse traces show successful requests
