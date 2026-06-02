# Security Notes

This project includes security defaults that should appear in a serious platform repo:

- Immutable container tags recommended for production.
- Non-root container runtime.
- Read-only root filesystem.
- Dropped Linux capabilities.
- NetworkPolicy with explicit ingress/egress boundaries.
- ECR scan-on-push and lifecycle policy.
- CI image scanning using Trivy.

Real production additions:

- External Secrets Operator with AWS Secrets Manager.
- OIDC federation from GitHub Actions to AWS instead of static credentials.
- Private EKS API endpoint with VPN/bastion access.
- Admission control with Kyverno or Gatekeeper.
