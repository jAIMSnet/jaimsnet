# Certificate Renewal Runbook

## Automatic Renewal

cert-manager automatically renews certificates before expiration. Monitor status:

```bash
kubectl get certificates --all-namespaces
kubectl get certificaterequests --all-namespaces
kubectl get orders --all-namespaces
```

## Troubleshooting Failed Renewals

### Check cert-manager Logs
```bash
kubectl logs -n ingress deployment/cert-manager
```

### Common Issues

1. **DNS challenge failures**: Verify DNS provider credentials
2. **Rate limiting**: Let's Encrypt has rate limits; check https://letsencrypt.org/docs/rate-limits/
3. **Webhook issues**: Check cert-manager webhook: `kubectl get pods -n ingress -l app=webhook`

### Force Renewal
```bash
# Delete the existing certificate secret to trigger renewal
kubectl delete secret <tls-secret-name> -n <namespace>

# Monitor the renewal
kubectl describe certificate <cert-name> -n <namespace>
```

## Verification

```bash
# Check certificate expiry
echo | openssl s_client -connect api.jaimsnet.com:443 2>/dev/null | openssl x509 -noout -dates
```
