#!/usr/bin/env bash
# This script creates a policy and AppRole for the tradingbot application
# Requires VAULT_ADDR and VAULT_TOKEN env vars set (admin token)
set -euo pipefail
POLICY_NAME=tradingbot-policy
ROLE_NAME=tradingbot-role
# Create policy
vault policy write $POLICY_NAME - <<'EOF'
path "secret/data/tradingbot/*" {
  capabilities = ["create","read","update","delete","list"]
}
EOF
# Create AppRole
vault auth enable approle || true
ROLE_ID=$(vault write -format=json auth/approle/role/$ROLE_NAME token_ttl=1h token_max_ttl=4h policies=$POLICY_NAME | jq -r '.data.role_id')
SECRET_ID=$(vault write -format=json auth/approle/role/$ROLE_NAME/secret-id -format=json | jq -r '.data.secret_id')
echo "ROLE_ID=$ROLE_ID"
echo "SECRET_ID=$SECRET_ID"
echo "Store these values securely (e.g., in CI secrets) for the app to authenticate."
