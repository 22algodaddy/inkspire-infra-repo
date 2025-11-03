# resource "aws_vpc" "this" {
#   cidr_block = var.vpc_cidr
#   tags = { Name = "${var.project}-vpc" }
# }

# resource "aws_subnet" "public_a" {
#   vpc_id            = aws_vpc.this.id
#   cidr_block        = cidrsubnet(aws_vpc.this.cidr_block, 8, 0)
#   availability_zone = data.aws_availability_zones.available.names[0]
#   tags = { Name = "${var.project}-public-a" }
# }

# resource "aws_subnet" "public_b" {
#   vpc_id            = aws_vpc.this.id
#   cidr_block        = cidrsubnet(aws_vpc.this.cidr_block, 8, 1)
#   availability_zone = data.aws_availability_zones.available.names[1]
#   tags = { Name = "${var.project}-public-b" }
# }

# data "aws_availability_zones" "available" {}
