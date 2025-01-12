 variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "private_subnets" {
  type    = list(any)
  default = []
}

variable "public_subnets" {
   type    = list(any)
  default = []
}

 variable "cluster_name" {
  type = string
  default = "my-eks-cluster"
 }
