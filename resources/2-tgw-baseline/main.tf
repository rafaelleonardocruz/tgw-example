locals {
    sa-asn = 65001
    sa-shared-cidr = "10.220.0.0/16"
    us-asn = 65002
    us-shared-cidr = "10.230.0.0/16"
}

module "tgw-sa" {
  source = "../../modules/tgw"
  
  providers = {
    aws = aws.sa-east-1
  }

  asn = local.sa-asn
  shared_cidr = local.sa-shared-cidr
}

module "tgw-us" {
  source = "../../modules/tgw"
  
  providers = {
    aws = aws.us-east-1
  }

  asn = local.us-asn
  shared_cidr = local.us-shared-cidr
}