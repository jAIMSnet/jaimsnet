# Security — Security Stack

| Field | Value |
|-------|-------|
| **Status** | ⬜ Phase 3 |
| **Last Updated** | 2026-03-06 |

## Components

| Tool | Directory | Purpose | Priority | Status |
|------|-----------|---------|:---:|--------|
| Trivy | `trivy/` | Container image vulnerability scanning | 🟠 P1 | ⬜ Phase 3 |
| Kyverno | `kyverno/` | K8s policy engine (enforce naming, labels, resource limits) | 🟠 P1 | ⬜ Phase 3 |
| CrowdSec | `crowdsec/` | Intrusion detection + WAF | 🟡 P2 | ⬜ Phase 3 |
| Falco | `falco/` | Runtime security monitoring | 🟡 P2 | ⬜ Phase 3 |

## Architecture

```
Container images ──► Trivy (scan before deploy)
                         │
Incoming traffic ──► CrowdSec (WAF + IDS)
                         │
Running pods     ──► Falco (runtime anomaly detection)
                         │
K8s policies    ──► Kyverno (policy enforcement)
```
