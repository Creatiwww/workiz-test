module "eks_cluster" {
  source = "./modules/cluster"

  vpc_subnets = data.aws_subnet.vpcsubnet
}

module "eks_nodes" {
  source = "./modules/nodes"

  vpc_subnets = data.aws_subnet.vpcsubnet
  cluster_name = module.eks_cluster.aws_eks_cluster_name
}


data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "vpcsubnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_subnet" "vpcsubnet" {
  for_each = toset(data.aws_subnets.vpcsubnets.ids)
  id       = each.value
}

# output "subnet_cidr_blocks" {
#  value = [for s in data.aws_subnet.example : s.id]
# }
