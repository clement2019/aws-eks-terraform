terraform {
  backend "s3" {
    bucket = "jenkins-automation-server"
    region = "eu-west-2"
    key    = "terraform-aws-eks/terraform.tfstate"
  }
}