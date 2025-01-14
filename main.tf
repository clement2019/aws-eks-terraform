resource "aws_iam_role" "eks-iam-role" {
 name = "devops-eks-iam-role"

 path = "/"

 assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
 role    = aws_iam_role.eks-iam-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
 role    = aws_iam_role.eks-iam-role.name
}
//======

# Public Subnet
//resource "aws_subnet" "public_subnets1" {
  //vpc_id            = aws_vpc.main.id
  
   //cidr_block        = var.public_subnet1_cidr_block
  //cidr_block        = element(var.public_subnet_cidr_block, count.index)
  //map_public_ip_on_launch = true
  //tags = {
   // Name = "my-server-Public-Subnet"
  //}
}
//resource "aws_subnet" "public_subnets2" {
  //vpc_id            = aws_vpc.main.id
  
  // cidr_block        = var.public_subnet2_cidr_block
  //cidr_block        = element(var.public_subnet_cidr_block, count.index)
  //map_public_ip_on_launch = true
  //tags = {
   // Name = "my-server-Public-Subnet2"
  //}
//}


# Private Subnet
//resource "aws_subnet" "private_subnets" {
  //vpc_id     = aws_vpc.main.id
  //cidr_block =var.private_subnet_cidr_block
  //tags = {
   // Name = "my-server-Private-Subnet"
  //}
//}
//resource "aws_vpc" "main" {
 // cidr_block = var.vpc_cidr
  //tags = {
   // Name = "my-vpc"
  //}
//}


//======

resource "aws_eks_cluster" "my-eks" {
 name = var.cluster_name
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {


  subnet_ids = [aws_subnet.public_subnets1.id,aws_subnet.private_subnets.id]
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}

resource "aws_iam_role" "workernodes" {
  name = "eks-node-group-example"

  assume_role_policy = jsonencode({
   Statement = [{
    Action = "sts:AssumeRole"
    Effect = "Allow"
    Principal = {
     Service = "ec2.amazonaws.com"
    }
   }]
   Version = "2012-10-17"
  })
 }

 resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role    = aws_iam_role.workernodes.name
 }

 resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role    = aws_iam_role.workernodes.name
 }

 resource "aws_iam_role_policy_attachment" "EC2InstanceProfileForImageBuilderECRContainerBuilds" {
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
  role    = aws_iam_role.workernodes.name
 }

 resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role    = aws_iam_role.workernodes.name
 }

 resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.my-eks.name
  node_group_name = "my-workernodes"
  node_role_arn  = aws_iam_role.workernodes.arn
  subnet_ids = [aws_subnet.public_subnets1.id,aws_subnet.private_subnets.id]
  instance_types = ["t2.medium"]

  scaling_config {
   desired_size = 2
   max_size   = 2
   min_size   = 1
  }

  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
 }
