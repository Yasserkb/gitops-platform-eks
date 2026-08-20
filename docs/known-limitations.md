# Known limitations

- No live AWS account or availability SLO is asserted by this portfolio repository.
- Remote Terraform state resources must be bootstrapped outside the state they protect.
- External Secrets and admission control are documented extension points, not installed components.
- The local Kind path cannot reproduce AWS load balancing, IAM, KMS, or multi-AZ failure behavior.
- Container signing and signature admission are not yet enforced.
