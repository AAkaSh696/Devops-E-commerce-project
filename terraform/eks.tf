module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.25.0"

  name               = local.name
  kubernetes_version = "1.35"

  endpoint_public_access  = true
  endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  addons = {
    coredns = {   #provide dns inside k8s cluster so that services(like frontend and backend can communicate)
      most_recent = true
    }

    kube-proxy = {  #kube-proxy participates in routing traffic to the appropriate backend Pods.
      most_recent = true
    }

    vpc-cni = {  #allows Pods to receive IP addresses from your VPC networking environment.
      most_recent    = true
      before_compute = true
    }

    eks-pod-identity-agent = {
      most_recent    = true
      before_compute = true
    }
  }

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.public_subnets

  control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_groups = {
    aks-demo-ng = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.medium"]
      capacity_type  = "SPOT"
      disk_size      = 35

      use_custom_launch_template = false

      attach_cluster_primary_security_group = true

      tags = {
        Name        = "aks-demo-ng"
        Environment = "dev"
        ExtraTag    = "e-commerce-app"
      }
    }
  }

  tags = local.tags
}


data "aws_instances" "eks_nodes" {
  instance_tags = {
    "eks:cluster-name" = module.eks.cluster_name
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }

  depends_on = [module.eks]
}
