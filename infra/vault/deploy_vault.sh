#!/usr/bin/env bash
# Deploy Vault via Helm (assumes helm and kubectl configured)
set -euo pipefail
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update
kubectl create ns vault || true
helm upgrade --install vault hashicorp/vault -n vault -f helm-values.yaml
echo "Vault deployed. Wait for pods to be ready and then initialize/unseal as required."
