# Kyverno Policies

Policy definitions enforced across the jAIMSnet cluster.

## Planned Policies

| Policy | Type | Description |
|--------|------|-------------|
| `disallow-privileged` | Validate | Block privileged containers |
| `require-labels` | Validate | Require standard labels on all resources |
| `require-resource-limits` | Validate | Require CPU/memory limits |
| `disallow-latest-tag` | Validate | Block `latest` image tag |
| `require-readonly-rootfs` | Validate | Require read-only root filesystem |
| `restrict-host-namespaces` | Validate | Block host PID/IPC/network |

Policy manifests will be placed in this directory.
