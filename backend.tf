terraform {
  backend "s3" {
    bucket = "jenkins-11134"
    region = "eu-west-2"
    key    = "terraform-aws-eks/terraform.tfstate"
  }
}