#!/bin/bash
# PostgreSQL Backup Script — DigitalOcean Managed PostgreSQL
# Last Updated: 2026-03-06
# Status: TODO — configure backup destination

set -euo pipefail

TIMESTAMP=$(date -u +%Y%m%dT%H%M%SZ)
BACKUP_DIR="/tmp/pg-backup-${TIMESTAMP}"

echo "=== jAIMSnet PostgreSQL Backup ==="
echo "Timestamp: ${TIMESTAMP}"
echo ""

# TODO: Set these from environment or Infisical
PG_HOST="${PG_HOST:-}"
PG_PORT="${PG_PORT:-25060}"
PG_USER="${PG_USER:-}"
PG_PASSWORD="${PG_PASSWORD:-}"

if [[ -z "$PG_HOST" ]]; then
  echo "ERROR: PG_HOST not set. Export PG_HOST before running."
  exit 1
fi

mkdir -p "$BACKUP_DIR"

echo "Backing up litellm database..."
PGPASSWORD="$PG_PASSWORD" pg_dump \
  --host="$PG_HOST" \
  --port="$PG_PORT" \
  --username="$PG_USER" \
  --no-password \
  --format=custom \
  --file="${BACKUP_DIR}/litellm-${TIMESTAMP}.dump" \
  litellm

echo "Backing up langfuse database..."
PGPASSWORD="$PG_PASSWORD" pg_dump \
  --host="$PG_HOST" \
  --port="$PG_PORT" \
  --username="$PG_USER" \
  --no-password \
  --format=custom \
  --file="${BACKUP_DIR}/langfuse-${TIMESTAMP}.dump" \
  langfuse

echo ""
echo "Backups written to: ${BACKUP_DIR}"
echo "TODO: Configure upload to DigitalOcean Spaces"
# TODO: aws s3 cp "${BACKUP_DIR}/" "s3://jaimsnet-backups/pg/${TIMESTAMP}/" \
#   --endpoint-url=https://nyc3.digitaloceanspaces.com --recursive
