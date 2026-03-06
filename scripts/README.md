# Scripts — Utility Scripts

| Field | Value |
|-------|-------|
| **Last Updated** | 2026-03-06 |

## Scripts

| Script | Purpose | Status |
|--------|---------|--------|
| `generate-secrets.sh` | Generate secrets → store in Infisical | ✅ Ready |
| `backup-pg.sh` | PostgreSQL backup | ⬜ TODO: configure DO Spaces |
| `verify-cluster.sh` | Cluster health check | ✅ Ready |

## Usage

```bash
# Generate secrets (values go to Infisical, not Git)
chmod +x scripts/generate-secrets.sh
./scripts/generate-secrets.sh

# Backup PostgreSQL databases
export PG_HOST=your-pg-host
export PG_USER=your-pg-user
export PG_PASSWORD=your-pg-password
./scripts/backup-pg.sh

# Verify cluster health
./scripts/verify-cluster.sh
```
