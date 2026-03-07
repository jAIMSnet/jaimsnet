# ADR-007: Grafana Stack for Observability

## Status
Accepted

## Context
We need a comprehensive observability stack covering metrics, logs, and traces. Options include the Grafana ecosystem (Prometheus, Loki, Alloy, Mimir) versus alternatives like Datadog, New Relic, or the ELK stack.

## Decision
Use the Grafana observability stack (Prometheus, Grafana, Loki, Alloy, Mimir).

## Rationale
- Fully open-source with no licensing costs
- Unified dashboarding through Grafana
- Prometheus is the industry standard for Kubernetes metrics
- Loki provides cost-effective log aggregation (indexes labels, not content)
- Alloy replaces multiple collectors (Prometheus exporter, Promtail, OTel collector)
- Mimir provides horizontally scalable long-term metrics storage
- Strong Kubernetes integration with service discovery

## Consequences
- Multiple components to manage and maintain
- Team must learn PromQL and LogQL query languages
- Higher initial setup complexity than SaaS alternatives
- Full data ownership and no per-seat licensing costs
- Flexible and extensible for future needs
