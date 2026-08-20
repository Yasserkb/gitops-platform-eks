variable "name" { type = string }
variable "cluster_version" { type = string }
variable "vpc_id" { type = string }
variable "private_subnets" { type = list(string) }
variable "tags" { type = map(string) }
variable "endpoint_public_access" {
  description = "Enable only when endpoint_public_access_cidrs is restricted to trusted operator networks."
  type        = bool
  default     = false
}
variable "endpoint_public_access_cidrs" {
  type    = list(string)
  default = []
  validation {
    condition     = alltrue([for cidr in var.endpoint_public_access_cidrs : cidr != "0.0.0.0/0"])
    error_message = "The Kubernetes API must never be open to the entire internet."
  }
}
variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}
