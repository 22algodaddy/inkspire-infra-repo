module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = ">= 19.0.0"

  cluster_name    = "${var.project}-eks"
  cluster_version = "1.28"
  subnets         = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  vpc_id          = aws_vpc.this.id

  node_groups = {
    ng-default = {
      desired_capacity = 2
      instance_type    = "t3.medium"
    }
  }

  manage_aws_auth = true
}
