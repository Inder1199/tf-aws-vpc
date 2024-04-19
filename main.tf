module "base_label" {
  source    = "cloudposse/label/null"
  version   = "0.25.0"
  namespace = "ll"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1a"]
  private_subnets = ["192.170.0.0/20", "192.170.2.0/20"]
  public_subnets  = ["192.170.50.0/20", "192.170.100.0/20"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
