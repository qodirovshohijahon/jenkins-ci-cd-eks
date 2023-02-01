terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  type = string
  default = "https://040505C1FE58D343A9F7F349DC0753D7.gr7.us-east-1.eks.amazonaws.com"
}

# variable "client_certificate" {
#   type = string
# }

# variable "client_key" {
#   type = string
# }

variable "cluster_ca_certificate" {
  type = string
  default = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1ESXdNVEV6TWpZMU9Wb1hEVE16TURFeU9URXpNalkxT1Zvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTkhoCk1Pd2dpTjZ1L2VpYnpMVEo0QzNyc0dxaEdYNElOQ2JBMWxkcGZuNHdRWUFVYURYWndON2xRQmpGYVpuTG5KYmsKdUlUdG9iZ3VlcUh4QUlQVUVTa1NWUnlvWm94NFRNNGdsUWFLYnV0L3pNWHpwTlkxdytSNm4yS3VkUSsxOHJ3VgpGYTlyRCt5SWFiSVJVTDhYcHBackNKOTVwN3pKNkhYd0U2VUtlNU1vMjVYT0lsQWoyaU96c1owK0ZlamhOdzROCjgyclRnUVRwa2hSNWF4aXpFaThCOWpZVWJtYUtvVmdRUkd6WFh2bzVjT3RVOGpwWXcrR1dCL1lOcnhocHgzUHgKU0lJWHVaWDBJR0liams1Vy96MDBrcWlyVWxrM3ZwZlQ0QmFyL0dUR1FLSHNrb1hnZkgyL25PTU9ESlhsNFJKKwptY1ZtNDlsWlZQMllISnlqdzRFQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZPQ1FTWDZsS3psWHVRVVBkMS9UajFHc09NTDVNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBRU9kc09DNThMNWFRK2NRdjJXbwpkUGFWT01TMFhLR3d1aGQ0K092TENRdTdWdlVUQmVudWJabnFJdk1VaHlER3c5RWxEVHIxK0k4TnBLallnQ2hsCmxuU2hjemJicWY1RkVQbHpLUGx5OC9nUHpaejV4VjhLdnc4ZjZzOTlwNGJyUHdFSmhDUUlRQ2Nlc1VpNC9IaGcKeFVDdVJycFlqUXJybEV3ZXhqbFF5R0NCcXFiS1BEanRXSC96VC9vRnU1SWRMbWtIS0t2ODZKVE5LOU5TWWFrSApYekoyZXFhN3p4NUdmQ3I2N3FRM1A3Y3hlU1E1dUVmbnhPRDdoWUR4eDZaUEQxYWtZUkdUUUtFNUV0NmMxYytWCjhVb2tPSDRSbU1wdG9IdWdiWnk2RmVUajI1VmRBRDJJUnhFSnNwcVBIQS8vWFdLZVZqNW4rRFBkNmw4STNNTzEKMjhRPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
}
variable "cluster_name" {
  type = "string"
  default = "dev"
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
