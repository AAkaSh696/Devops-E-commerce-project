output "region" {
  description = "Gives aws region where resources are created"
  value = var.my_enviroment
}

output "vpc_id" {
  description = "The ID of the created VPC"
  value = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "EKS Cluster name"
  value = module.eks_cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value = module.eks_cluster_endpoint
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value = aws.instance.testinstance.public_ip
}