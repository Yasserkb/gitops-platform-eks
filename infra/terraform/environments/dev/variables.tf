variable "aws_region" {
  description = "AWS region for the EKS platform."
  type        = string
  default     = "eu-west-1"
}

variable "project" {
  description = "Project name prefix."
  type        = string
  default     = "yasser-gitops"
}

variable "cluster_version" {
  description = "Kubernetes version for EKS."
  type        = string
  default     = "1.31"
}
