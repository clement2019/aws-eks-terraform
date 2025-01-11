Amazon EKS cluster in AWS cloud using Terraform 

we can create EKS cluster with following node types:
Managed nodes -  Linux - Amazon EC2 instances
Fargate - Serverless
We will learn how to create EKS cluster based on Managed nodes (EC2 instances).

EKS cluster can be created in following different ways

1. AWS console
2. AWS CLI
3. eksctl command
4. using Terraform

We will create EKS cluster nodes using Terraform.
Pre-requisites:

This Lab is using an EC2 instance with following configured:

Install Terraform 

Install AWS CLI

Install kubectl  – A command line tool for working with Kubernetes clusters. 

Create an IAM role with AdministratorAccess policy or add AWS root keys

Make sure you have already VPC created with at least two subnets

Create IAM Role with Administrator Access

You need to create an IAM role with AdministratorAccess policy.
Go to AWS console, IAM, click on Roles. create a role