# Architecture

## Design principles

1. **Git is the source of truth**: cluster state is reconciled by Argo CD.
2. **Separation of concerns**: Terraform creates cloud primitives; Argo CD manages Kubernetes objects.
3. **Environment promotion**: dev, staging, and prod have separate Helm values.
4. **Observable by default**: applications expose metrics and ship ServiceMonitor + PrometheusRule.
5. **Safe defaults**: non-root containers, NetworkPolicy, resource requests, PDB, HPA.

## Control planes

- AWS control plane: VPC, EKS, ECR, IAM.
- Kubernetes control plane: Argo CD, Prometheus Operator, workloads.
- Delivery control plane: GitHub Actions.
