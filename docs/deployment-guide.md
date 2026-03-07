# Deployment Guide

## Prerequisites

- DigitalOcean account with API token
- Domain name with DNS configured
- kubectl v1.28+
- Helm v3.12+
- OpenTofu v1.6+
- Ansible v2.15+

## Phase 1: Infrastructure Provisioning

### 1.1 Configure OpenTofu Variables

```bash
cd iac/opentofu/environments/production
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

### 1.2 Provision Infrastructure

```bash
tofu init
tofu plan
tofu apply
```

This creates:
- VPC with private networking
- DOKS Kubernetes cluster
- Managed PostgreSQL database
- DNS records
- GPU Droplet (optional)

### 1.3 Configure kubectl

```bash
doctl kubernetes cluster kubeconfig save jaimsnet-production
```

## Phase 2: Core Services

### 2.1 Install Argo CD

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd -n argocd --create-namespace -f gitops/argocd/values.yaml
```

### 2.2 Install Infisical Operator

```bash
helm repo add infisical https://dl.cloudsmith.io/public/infisical/helm-charts/helm/charts/
helm install infisical-operator infisical/secrets-operator -n secrets --create-namespace
```

### 2.3 Install ingress-nginx and cert-manager

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress --create-namespace

helm repo add jetstack https://charts.jetstack.io
helm install cert-manager jetstack/cert-manager -n ingress --set installCRDs=true
```

## Phase 3: Application Services

### 3.1 Deploy via Argo CD

```bash
kubectl apply -f gitops/argocd/applications/
```

Argo CD will automatically sync and deploy:
- LiteLLM + Redis
- Langfuse
- Prometheus + Grafana + Loki
- Alloy + Mimir
- Security tools (Kyverno, Falco, Trivy)

## Phase 4: Verification

```bash
# Check all pods are running
kubectl get pods --all-namespaces

# Verify ingress endpoints
curl -I https://api.jaimsnet.com/health
curl -I https://trace.jaimsnet.com

# Check Argo CD sync status
kubectl get applications -n argocd
```

## Rollback

To rollback a deployment:
```bash
# Via Argo CD
argocd app rollback <app-name>

# Via Helm
helm rollback <release-name> <revision> -n <namespace>
```
