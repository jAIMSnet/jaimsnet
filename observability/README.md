# Observability

Comprehensive monitoring, logging, tracing, and alerting for the jAIMSnet platform.

## Components

| Component | Purpose |
|-----------|---------|
| [langfuse/](langfuse/) | LLM observability and tracing |
| [prometheus/](prometheus/) | Metrics collection and alerting |
| [grafana/](grafana/) | Dashboards and visualization |
| [loki/](loki/) | Log aggregation |
| [alloy/](alloy/) | OpenTelemetry collector |
| [mimir/](mimir/) | Long-term metrics storage |
| [uptime-kuma/](uptime-kuma/) | Uptime monitoring and status page |

## Architecture

```
Applications → Alloy (collector) → Prometheus (metrics)
                                  → Loki (logs)
                                  → Mimir (long-term metrics)
                                  → Grafana (visualization)

LiteLLM → Langfuse (LLM tracing)

External → Uptime Kuma (availability monitoring)
```

## Namespace

All observability components run in the `observability` namespace.
