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


* Install Kubectl: A command line tool working Kubernetes clusters
* Create an IAM role with AdministratorAccess policy or add AWS root keys



![eks-admin-role](https://github.com/user-attachments/assets/0bc67fea-59cc-4afb-9f43-bb2c912ddf96)


make sure that you have the permsion set for th e role to ba attchaned to the ec2 inanstance


![iam role](https://github.com/user-attachments/assets/e50ff3e5-83cd-431f-8e41-a39fc7f68549)



![iam role-2](https://github.com/user-attachments/assets/36f14a88-4eed-452c-a099-aa7d693fdfc6)


* make sure it has the right permission


Now having given the ec2 instance the right permisson has shown above to be able to carry creation of kubernstes cluster
we need to connect to the ec2 machine using ssh connection(ssh client) as shown below


<img width="1440" alt="Screenshot 2025-01-15 at 13 27 21" src="https://github.com/user-attachments/assets/4e95d452-e49d-4972-94bd-f9d37b1a62c8" />




Now create all the terraform files inside the "aws-terraform" prpject direcrory

README.md  

backend.tf 

command.md 

 installation-script.sh 

 main.tf 

provider.tf 

variable.tf

view the content of the main.tf below





Now run the command below to updZte the package on the brown new machine
sudo apt update -y

<img width="1440" alt="Screenshot 2025-01-15 at 13 24 32" src="https://github.com/user-attachments/assets/411d0846-69ec-4bd0-ae88-00c02d7a80b0" />


<img width="1440" alt="Screenshot 2025-01-15 at 13 22 29" src="https://github.com/user-attachments/assets/5f9f3bac-765a-40f2-88f0-5eb7f2db9d09" />


<img width="1440" alt="Screenshot 2025-01-15 at 13 24 32" src="https://github.com/user-attachments/assets/cebb6e59-ab55-4572-bfc5-c1ca6aded038" />


<img width="1440" alt="Screenshot 2025-01-15 at 13 25 16" src="https://github.com/user-attachments/assets/f9528ac6-68cf-4e98-84ee-9f47efed7588" />


The kubernetes cluster script are shown below

<img width="1440" alt="Screenshot 2025-01-15 at 12 59 32" src="https://github.com/user-attachments/assets/905c4b2f-2e14-4333-b44f-d19d36cf674f" />


## Running Terraform commands:
The first command is to run  the command below
terraform init 

this command will help to initaolise the backend s3 bucket configuration so that teeraform can store the terraform state files there

<img width="1440" alt="Screenshot 2025-01-15 at 12 53 03" src="https://github.com/user-attachments/assets/075a0815-4f08-49de-a1d0-9f24b69fac2e" />


for this project i used aws default vpc and selected two subnets attached to my region
the two subnets id select were mentioned in my variable.tf file as default.
The terraform plan showing how many resources will be creted are shown below


<img width="1440" alt="Screenshot 2025-01-15 at 12 59 19" src="https://github.com/user-attachments/assets/34f65f7f-2298-4ec3-bdb6-972a09c40a59" />


# Now Run the command to finally create the aws-eks cluster as shown below

terraform apply --auto-approve

This will create 12 resources.



<img width="1440" alt="Screenshot 2025-01-15 at 13 51 14" src="https://github.com/user-attachments/assets/4aa7195e-6667-4c17-9295-e1261809dcf4" />


<img width="1440" alt="Screenshot 2025-01-15 at 13 51 35" src="https://github.com/user-attachments/assets/96a7ef83-927f-4c4e-a5e7-54bbbe1e9c7e" />


# Now confirm the aws-eks cluster creation

<img width="1440" alt="Screenshot 2025-01-15 at 14 00 07" src="https://github.com/user-attachments/assets/255a428a-9ae5-434b-9883-ac9178e83cef" />


<img width="1440" alt="Screenshot 2025-01-15 at 13 59 54" src="https://github.com/user-attachments/assets/aa4b451c-f31b-45b3-80a1-b6f3ce1ede46" />



## Update Kube config

Update Kube config by entering below command:

aws eks update-kubeconfig --name my-eks-cluster --region eu-west-2

<img width="1440" alt="Screenshot 2025-01-15 at 14 14 02" src="https://github.com/user-attachments/assets/cf188e6d-5086-4583-b8ca-c3cd0cca19b5" />



kubeconfig file be updated under /home/ubuntu/.kube folder.

you can view the kubeconfig file by entering the below command:

cat /home/ubuntu/.kube/config

<img width="1440" alt="Screenshot 2025-01-15 at 14 15 00" src="https://github.com/user-attachments/assets/b5234f01-3689-4e72-8c80-3c28ae61d200" />

Connect to EKS cluster using kubectl commands

To view the list of worker nodes as part of EKS cluster.

kubectl get nodes

<img width="1440" alt="Screenshot 2025-01-15 at 14 16 15" src="https://github.com/user-attachments/assets/4100fc1d-5e04-42d1-8e6d-8f9a35d76569" />



kubectl get ns

<img width="1440" alt="Screenshot 2025-01-15 at 14 20 10" src="https://github.com/user-attachments/assets/de508529-e17c-44f9-ab34-33f7020b5f40" />


# Deploy Nginx on a Kubernetes Cluster
Let us run some apps to make sure they are deployed to Kubernetes cluster. The below command will create deployment:

kubectl create deployment nginx --image=nginx

<img width="1440" alt="Screenshot 2025-01-15 at 14 21 16" src="https://github.com/user-attachments/assets/3e6768ca-e763-4f78-9e21-84a14e1771cf" />

# View Deployments
kubectl get deployments

# Delete EKS Cluster

# terraform destroy
<img width="1440" alt="Screenshot 2025-01-15 at 14 29 26" src="https://github.com/user-attachments/assets/f6b9cdef-bc3e-4fae-b3f6-8a3cbb5cf258" />


<img width="1440" alt="Screenshot 2025-01-15 at 14 38 18" src="https://github.com/user-attachments/assets/1de942fa-eea4-4dbf-ada6-3e4907a25fcf" />


the above command should delete the EKS cluster in AWS, it might take a few mins to clean up the cluster.


