# CI/CD Details

This project includes:
- SBOM generation via Syft in CI and CD pipelines
- Image scanning via Trivy
- Image signing via cosign in CD
- Helm auto-deploy to Kubernetes (deliverybot/helm or kubectl + helm)

Secrets required (store in GitHub secrets):
- REGISTRY_USERNAME / REGISTRY_PASSWORD or GITHUB_TOKEN
- KUBECONFIG (base64 encoded) for deployment
- COSIGN_PASSWORD (or cosign key in actions secrets)
- VAULT_ADDR / VAULT_TOKEN for AppRole bootstrap (if automated)
