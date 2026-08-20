# Gap analysis

| Requirement | Current state | Action |
|---|---|---|
| Reproducible EKS | VPC/EKS/ECR modules and pinned providers exist | Keep `terraform validate` and security scanning in CI |
| Restricted API | Private access is enabled; public access now defaults off | Use an approved VPN/bastion path, or explicitly supply restricted CIDRs |
| GitOps ownership | Argo root app and ApplicationSet exist | Protect production values with repository approvals |
| Safe workload | Non-root, read-only filesystem, resources, probes, HPA and PDB exist | Add signed-image admission before claiming verified provenance |
| Network isolation | Namespace-scoped ingress and DNS-only egress are chart defaults | Validate the selected CNI enforces NetworkPolicy |
| Secrets | No secrets are committed | Install External Secrets and bind least-privilege workload identity in a live environment |
| Supply chain | Test, build, Trivy and Helm validation exist | Add SBOM, signature, IaC scan, schema validation and policy tests |
| Recovery | Runbook describes rollback and drift | Capture a repeatable local Kind/Argo run as evidence |
| Terraform state | Environment exists, backend bootstrap is not automated | Provision encrypted S3 state and locking separately before team use |
| Cost safety | Cloud apply is manual | Add explicit estimate/destroy checks before any real deployment |
