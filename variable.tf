
# networking


variable "public_subnet1_cidr_block" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}

variable "cluster_name" {
  type = string
  default = "my-eks-cluster"
 }
