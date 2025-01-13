 variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "private_subnet_cidr_block" {
  type    = string
  default = []
}

variable "public_subnet_cidr_block"{
   type    = string
  default = []
}

 variable "cluster_name" {
  type = string
  default = "my-eks-cluster"
 }
