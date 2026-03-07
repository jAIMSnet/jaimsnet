# Integration Tests

End-to-end integration tests for the jAIMSnet platform.

## Overview

Integration tests verify that platform components work correctly together. Tests are designed to run against a deployed environment.

## Planned Test Suites

| Suite | Description |
|-------|-------------|
| Gateway Integration | Verify LiteLLM routing to model providers |
| Secret Sync | Verify Infisical → Kubernetes secret propagation |
| Observability Pipeline | Verify traces flow from LiteLLM → Langfuse |
| Ingress Routing | Verify external access to all services |
| Authentication | Verify API key validation and access control |

## Running Tests

```bash
# Tests will be runnable via:
cd testing/integration
# Test runner and instructions TBD
```

## Status

🟡 Integration test framework is planned.
