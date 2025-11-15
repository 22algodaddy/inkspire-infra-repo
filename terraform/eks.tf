module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "my-cluster"
  kubernetes_version = "1.33"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }

  # Optional
  endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = aws_vpc.this.id
  subnet_ids               = [aws_subnet.public_a.id, aws_subnet.public_b.id]

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
  example = {
    ami_type       = "AL2023_x86_64_STANDARD"
    instance_types = ["t3.small"]

    min_size     = 1
    max_size     = 2
    desired_size = 1
  }
}

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}