locals {
  environment = "dev"
  name        = "${var.project}-${local.environment}"
  tags = {
    Project     = var.project
    Environment = local.environment
    Owner       = "YasserKoubachi"
    ManagedBy   = "Terraform"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  name       = local.name
  cidr_block = "10.42.0.0/16"
  az_count   = 3
  tags       = local.tags
}

module "eks" {
  source = "../../modules/eks"

  name            = local.name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  tags            = local.tags
}

module "ecr" {
  source = "../../modules/ecr"

  repositories = ["demo-api"]
  tags         = local.tags
}
