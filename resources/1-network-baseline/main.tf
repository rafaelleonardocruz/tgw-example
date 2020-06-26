locals {
    us-east-1 = [
        {
            name = "prod"
            cidr = "10.200.0.0/16"
        },
        {
            name = "stg"
            cidr = "10.201.0.0/16"
        },
        {
            name = "dev"
            cidr = "10.202.0.0/16"
        },
    ]

    sa-east-1 = [
        {
            name = "prod"
            cidr = "10.100.0.0/16"
        },
        {
            name = "stg"
            cidr = "10.101.0.0/16"
        },
        {
            name = "dev"
            cidr = "10.102.0.0/16"
        },
    ]
}

module "vpcs_us" {
    source = "../../modules/vpc"
    count = length(local.us-east-1)

    providers = {
        aws = aws.us-east-1
    }
    
    name = local.us-east-1[count.index].name
    cidr = local.us-east-1[count.index].cidr
}

module "shared_vpc_us" {
    source = "../../modules/shared-vpc"

    providers = {
        aws = aws.us-east-1
    }
    
    name = "sharedservices"
    cidr = "10.220.0.0/16"
}

module "vpc_sa" {
    source = "../../modules/vpc"
    count = length(local.sa-east-1)

    providers = {
        aws = aws.sa-east-1
    }
    
    name = local.sa-east-1[count.index].name
    cidr = local.sa-east-1[count.index].cidr
}

module "shared_vpc_sa" {
    source = "../../modules/shared-vpc"

    providers = {
        aws = aws.sa-east-1
    }
    
    name = "sharedservices"
    cidr = "10.230.0.0/16"
}