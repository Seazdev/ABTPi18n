# Installation Guide (Dev & Prod)

## Dev (Docker Compose)
1. Copy .env.example to .env and set variables.
2. docker-compose up -d --build
3. Visit http://localhost:8000/health

## Prod (Kubernetes)
- Use helm chart in `helm/` and configure secrets via Vault.
- Ensure NetworkPolicies and OPA are applied before workloads.
