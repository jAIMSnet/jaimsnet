# kube-bench

CIS Kubernetes Benchmark compliance checking.

## Overview

kube-bench runs the CIS Kubernetes Benchmark tests against the cluster configuration to identify security issues and hardening opportunities.

## Usage

Run as a Kubernetes Job:
```bash
kubectl apply -f kube-bench-job.yaml
kubectl logs -l app=kube-bench
```

## Checks

- Control plane configuration
- etcd configuration
- Worker node security
- Kubernetes policies
- Network policies

## Scheduling

Planned as a periodic CronJob to continuously verify cluster security posture. Results are exported to Prometheus metrics.
