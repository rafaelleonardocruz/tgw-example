locals {
    blackhole = [
        {
            env = "prod"
            envs = [
              "dev",
              "stg",
            ]
        },
        {
            env = "stg"
            envs = [
              "dev",
              "prod",
            ]
        },
        {
            env = "dev"
            envs = [
              "prod",
              "stg",
            ]
        },
    ]
}

module "backhole_us" {
    source = "../../modules/tgw-blackhole"
    count = length(local.blackhole)

    providers = {
        aws = aws.us-east-1
    }
    
    env = local.blackhole[count.index].env
    envs_to_deny = local.blackhole[count.index].envs
}

module "backhole_sa" {
    source = "../../modules/tgw-blackhole"
    count = length(local.blackhole)

    providers = {
        aws = aws.sa-east-1
    }
    
    env = local.blackhole[count.index].env
    envs_to_deny = local.blackhole[count.index].envs
}