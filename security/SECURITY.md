# Security Add-ons (Full Option)

This document lists security controls and implementation notes required for production:
- Secrets: HashiCorp Vault (transit, kv v2), policies, AppRole, dynamic secrets for DB
- CI/CD: Sign images with cosign, scan with Trivy, generate SBOM with Syft
- Runtime: Falco for behavior detection, Aqua or Falco, Falco rules included
- Network: Kubernetes NetworkPolicies deny-by-default, Istio or Linkerd mTLS for service mesh
- Admission: OPA/Gatekeeper policies to enforce securityContext, disallow privileged containers
- Logging: Centralized logging with Loki/Promtail + ELK (optional)
- Monitoring: Prometheus node-exporter, cAdvisor, Grafana dashboards
- Backup: Encrypted pg_dump schedule, S3-compatible storage, key management
- DR: Runbook for RTO/RPO, periodic failover drills
- Hardening: CIS benchmarks, disable unused services, host sysctl tuning
