#!/bin/bash
# Generate Secrets for jAIMSnet
# Output values go to Infisical — NOT to Git
# Last Updated: 2026-03-06

set -euo pipefail

echo "=== jAIMSnet Secret Generator ==="
echo "Generated values should be stored in Infisical Cloud (project: jaims-net)"
echo "DO NOT commit any of these values to Git."
echo ""

generate_secret() {
  local name="$1"
  local length="${2:-32}"
  local value
  value=$(openssl rand -hex "$length")
  echo "$name=$value"
}

echo "--- LiteLLM Secrets ---"
generate_secret "LITELLM_MASTER_KEY" 32
echo ""

echo "--- Redis Secrets ---"
generate_secret "REDIS_PASSWORD" 24
echo ""

echo "--- Langfuse Secrets ---"
generate_secret "LANGFUSE_SALT" 32
generate_secret "LANGFUSE_NEXTAUTH_SECRET" 32
echo ""

echo ""
echo "=== Store these values in Infisical ==="
echo "Project: jaims-net | Environment: production"
echo "Also set manually: DATABASE_URL, LANGFUSE_DATABASE_URL,"
echo "  OPENAI_API_KEY, ANTHROPIC_API_KEY, GEMINI_API_KEY,"
echo "  LANGFUSE_PUBLIC_KEY, LANGFUSE_SECRET_KEY"
