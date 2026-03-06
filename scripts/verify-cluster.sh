#!/bin/bash
# Cluster Health Verification Script — jAIMSnet
# Last Updated: 2026-03-06

set -euo pipefail

echo "=== jAIMSnet Cluster Health Check ==="
echo "Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo ""

PASS=0
FAIL=0

check() {
  local name="$1"
  local cmd="$2"
  if eval "$cmd" > /dev/null 2>&1; then
    echo "✅ $name"
    PASS=$((PASS + 1))
  else
    echo "❌ $name"
    FAIL=$((FAIL + 1))
  fi
}

echo "--- Nodes ---"
check "Nodes Ready" "kubectl get nodes | grep -v NotReady | grep Ready"

echo ""
echo "--- Namespaces ---"
check "ingress-nginx namespace" "kubectl get ns ingress-nginx"
check "cert-manager namespace" "kubectl get ns cert-manager"
check "gateway namespace" "kubectl get ns gateway"
check "observability namespace" "kubectl get ns observability"

echo ""
echo "--- Ingress Controller ---"
check "ingress-nginx pods running" "kubectl get pods -n ingress-nginx | grep Running"
check "ingress-nginx LoadBalancer IP" "kubectl get svc -n ingress-nginx ingress-nginx-controller | grep 129.212.240.75"

echo ""
echo "--- cert-manager ---"
check "cert-manager pods running" "kubectl get pods -n cert-manager | grep Running"
check "ClusterIssuer ready" "kubectl get clusterissuer letsencrypt-prod -o jsonpath='{.status.conditions[0].type}' | grep Ready"

echo ""
echo "--- TLS Certificates ---"
check "litellm TLS certificate" "kubectl get certificate litellm-tls -n gateway"
check "langfuse TLS certificate" "kubectl get certificate langfuse-tls -n observability"

echo ""
echo "--- Summary ---"
echo "Passed: ${PASS} | Failed: ${FAIL}"

if [[ $FAIL -gt 0 ]]; then
  exit 1
fi
