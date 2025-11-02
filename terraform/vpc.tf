
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
  name    = local.project
  cidr    = "10.0.0.0/16"
  # Avoid data sources for offline planning; synthesize AZ names from region
  azs                 = ["ap-southeast-1a"]
  public_subnets      = ["10.0.1.0/24"]
  private_subnets     = []
  enable_nat_gateway      = true
  single_nat_gateway      = false
  one_nat_gateway_per_az  = true
  enable_dns_hostnames    = true
  enable_dns_support      = true
  enable_flow_log         = false
  
}
