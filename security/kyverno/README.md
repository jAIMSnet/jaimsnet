# Kyverno — K8s Policy Engine

| Field | Value |
|-------|-------|
| **Helm Chart** | `kyverno/kyverno` |
| **Purpose** | K8s policy enforcement (no privileged pods, require labels, resource limits) |
| **Priority** | 🟠 P1 |
| **Status** | ⬜ Phase 3 |
| **Last Updated** | 2026-03-06 |

## Policies

| Policy | File | Action | Status |
|--------|------|--------|--------|
| Require labels | `policies/require-labels.yaml` | Audit | ⬜ Phase 3 |
| Require resource limits | `policies/require-resource-limits.yaml` | Audit | ⬜ Phase 3 |
| Disallow privileged | `policies/disallow-privileged.yaml` | Enforce | ⬜ Phase 3 |
