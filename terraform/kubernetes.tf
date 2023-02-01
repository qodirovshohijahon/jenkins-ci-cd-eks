terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  type = string
}

# variable "client_certificate" {
#   type = string
# }

# variable "client_key" {
#   type = string
# }

variable "cluster_ca_certificate" {
  type = string
}
variable "cluster_name" {
  type = string
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}
# provider "kubernetes" {
#   host = var.host

#   client_certificate     = base64decode(var.client_certificate)
#   client_key             = base64decode(var.client_key)
#   cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
# }

provider "kubernetes" {
  host = var.host
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  token                  = data.aws_eks_cluster_auth.cluster.token

  # exec {
  #   api_version = "client.authentication.k8s.io/v1beta1"
  #   command     = "aws"
  #   # This requires the awscli to be installed locally where Terraform is executed
  #   args = ["eks", "get-token", "--cluster-name", var.cluster_name]
  # }
}
output "endpoint" {
  value = data.aws_eks_cluster.example.endpoint
}