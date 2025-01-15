# aws-eks-terraform
This project show cases the provisioning of aws-eks cluster within the aws ecosystem using terraform

What is Amazon EKS

Amazon EKS is a fully managed container orchestration service. EKS allows you to quickly deploy a production ready Kubernetes cluster in AWS, deploy and manage containerized applications more easily with a fully managed Kubernetes service. Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications.


EKS takes care of master node/control plane. We need to create worker nodes.

You can create EKS cluster with following node types:
Managed nodes -  Linux - Amazon EC2 instances
Fargate - Serverless
We will learn how to create EKS cluster based on Managed nodes (EC2 instances).

The project architecture diagram below

![EKS Cluster Architecture (1)](https://github.com/user-attachments/assets/296175c9-c5fa-4849-a572-4905e58e8cac)


 

EKS cluster can be created in following different ways

1. AWS console
2. AWS CLI
3. eksctl command
4. using Terraform

We will create EKS cluster nodes using Terraform.



Pre-requisites:
This Lab is using an EC2 instance with following configured:

* Install terraform 
* Install Aws cli
* Install Kubectl: A command line tool working Kubernetes clusters
* Create an IAM role with AdministratorAccess policy or add AWS root keys
* Make sure you have already VPC created with at least two subnets




<img width="1440" alt="Screenshot 2025-01-15 at 10 55 14" src="https://github.com/user-attachments/assets/237433b4-6f70-4919-8e71-8f9e8d08a482" />
