# Current state

## Verified repository capabilities

- Terraform modules provision a multi-AZ VPC, EKS managed node group, and ECR.
- Argo CD uses a root application and ApplicationSet for environment delivery.
- The demo service has tests, a multi-stage container, health probes, metrics, HPA, PDB, and a restricted runtime security context.
- Prometheus rules, a Grafana dashboard, and environment-specific Helm values are versioned.
- CI tests the service, builds and scans its image, and validates the Helm chart.

## Production-readiness boundary

This repository is an executable platform reference, not evidence of a currently operated AWS production cluster. Cloud apply is deliberately manual and billable. The private EKS endpoint default requires an operator connected to the VPC. External Secrets, admission policy enforcement, remote state bootstrap, image signing, and a full local recovery recording remain explicit follow-up work.

## Ownership boundary

Terraform owns AWS infrastructure and cluster prerequisites. Argo CD owns in-cluster desired state. Application CI builds and verifies artifacts; it does not deploy with `kubectl`.
