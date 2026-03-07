# Security

Security tooling and policies for the jAIMSnet platform.

## Components

| Component | Purpose |
|-----------|---------|
| [kyverno/](kyverno/) | Kubernetes policy engine |
| [trivy/](trivy/) | Container vulnerability scanning |
| [falco/](falco/) | Runtime threat detection |
| [crowdsec/](crowdsec/) | Collaborative intrusion detection |
| [kube-bench/](kube-bench/) | CIS Kubernetes benchmark |
| [docker-bench/](docker-bench/) | Docker security audit |

## Defense-in-Depth Strategy

```
Build Time:    Trivy (image scanning in CI)
Admission:     Kyverno (policy enforcement)
Runtime:       Falco (syscall monitoring)
Network:       CrowdSec (IDS/IPS)
Compliance:    kube-bench (CIS benchmarks)
Host:          docker-bench (Docker security)
```
