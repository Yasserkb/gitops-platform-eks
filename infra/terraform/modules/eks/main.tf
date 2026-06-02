module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.name
  kubernetes_version = var.cluster_version

  endpoint_public_access  = true
  endpoint_private_access = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  enable_irsa = true

  addons = {
    coredns                = {}
    kube-proxy             = {}
    vpc-cni                = {}
    aws-ebs-csi-driver     = {}
    eks-pod-identity-agent = {}
  }

  eks_managed_node_groups = {
    platform = {
      instance_types = ["t3.large"]
      min_size       = 2
      max_size       = 6
      desired_size   = 2
      labels = {
        workload = "platform"
      }
    }
  }

  tags = var.tags
}
