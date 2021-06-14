module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc-name
  cidr = local.vpc-cidrblock

  azs = [for s in local.azs_availability : data.aws_availability_zones.available.names[s]]

  public_subnets      = [cidrsubnet(local.vpc-cidrblock, 4, 0), cidrsubnet(local.vpc-cidrblock, 4, 1)]
  private_subnets     = [cidrsubnet(local.vpc-cidrblock, 4, 2), cidrsubnet(local.vpc-cidrblock, 4, 3)]
  database_subnets    = [cidrsubnet(local.vpc-cidrblock, 4, 4), cidrsubnet(local.vpc-cidrblock, 4, 5)]
  

  #Tier Tags 

  database_subnet_tags = {
    tier = "database"
  }
  public_subnet_tags = {
    tier = "public"
  }
  private_subnet_tags = {
    tier = "private"
  }
  
  ################

  enable_nat_gateway               = true
  enable_vpn_gateway               = false
  enable_dns_hostnames             = true
  default_vpc_enable_dns_hostnames = true
  default_vpc_enable_dns_support   = true
  enable_dns_support               = true
  enable_dhcp_options              = true

  tags = local.tags

}