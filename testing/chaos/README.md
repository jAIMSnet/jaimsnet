# Chaos Engineering Tests

Chaos engineering tests for resilience validation of the jAIMSnet platform.

## Overview

Chaos tests intentionally inject failures to verify that the platform degrades gracefully and recovers automatically.

## Planned Experiments

| Experiment | Target | Expected Outcome |
|------------|--------|------------------|
| Pod failure | LiteLLM pods | Kubernetes restarts pods, no downtime |
| Node failure | Worker node | Pods rescheduled to healthy nodes |
| Network partition | Inter-namespace | Services handle timeouts gracefully |
| Redis failure | Cache layer | LiteLLM falls back to direct provider calls |
| Database failover | PostgreSQL | Managed DB automatic failover |

## Tools

- Chaos Mesh or LitmusChaos (Kubernetes-native)
- Custom scripts for VM-based workloads

## Status

🟡 Chaos testing framework is planned.
