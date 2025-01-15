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
* Install Aws cli and run aws confirhure to insert the secret key and access key for the IAM user created if neccessary
but in most cases if the IAm role crreated has administrative access and it attached to the ec2 inance is more than enough to deply the cluster

<img width="1440" alt="Screenshot 2025-01-15 at 11 46 37" src="https://github.com/user-attachments/assets/ca2dea61-81e7-4ae7-96a6-9046788c82ac" />


* Install Kubectl: A command line tool working Kubernetes clusters
* Create an IAM role with AdministratorAccess policy or add AWS root keys

<img width="1440" alt="Screenshot 2025-01-15 at 10 55 14" src="https://github.com/user-attachments/assets/c95e3ed8-d348-49c8-ba25-9e7c77e2a4b2" />



![eks-admin-role](https://github.com/user-attachments/assets/0bc67fea-59cc-4afb-9f43-bb2c912ddf96)


make sure that you have the permsion set for th e role to ba attchaned to the ec2 inanstance


![iam role](https://github.com/user-attachments/assets/e50ff3e5-83cd-431f-8e41-a39fc7f68549)



![iam role-2](https://github.com/user-attachments/assets/36f14a88-4eed-452c-a099-aa7d693fdfc6)





* make sure it has the right permision

<img width="1440" alt="Screenshot 2025-01-15 at 10 55 14" src="https://github.com/user-attachments/assets/237433b4-6f70-4919-8e71-8f9e8d08a482" />



Now having given the ec2 instance the right perosmion has shown above to be able to carry creation of kubernstes cluster
we need to connect to the ec2 machine using ssh connection(ssh client) as shown below

<img width="1440" alt="Screenshot 2025-01-15 at 12 07 21" src="https://github.com/user-attachments/assets/da8bb15f-6757-4b97-8ee3-8d35ae2fe463" />
<img width="1440" alt="Screenshot 2025-01-15 at 12 07 21" src="https://github.com/user-attachments/assets/8e68e081-08d2-4690-932a-bc7b06e4146e" />
<img width="1440" alt="Screenshot 2025-01-15 at 10 55 14" src="https://github.com/user-attachments/assets/5b58ca4f-1270-43f4-9cf7-eb8d498c5e72" />



Make sure you have already VPC created with at least two subnets