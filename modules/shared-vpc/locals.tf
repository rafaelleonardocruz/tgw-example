locals {
    private_subnets = [
        {
            cidr = cidrsubnet(var.cidr, 8, 10)
            az   = data.aws_availability_zones.this.names[0]
        },
        {
            cidr = cidrsubnet(var.cidr, 8, 11)
            az   = data.aws_availability_zones.this.names[1]
        },
        {
            cidr = cidrsubnet(var.cidr, 8, 12)
            az   = data.aws_availability_zones.this.names[2]
        },
    ]

    public_subnets = [
        {
            cidr = cidrsubnet(var.cidr, 8, 100)
            az   = data.aws_availability_zones.this.names[0]
        },
        {
            cidr = cidrsubnet(var.cidr, 8, 101)
            az   = data.aws_availability_zones.this.names[1]
        },
        {
            cidr = cidrsubnet(var.cidr, 8, 102)
            az   = data.aws_availability_zones.this.names[2]
        },
    ]

    attachment_subnets = [
        {
            cidr = cidrsubnet(var.cidr, 8, 200)
            az   = data.aws_availability_zones.this.names[0]
        },
        {
            cidr = cidrsubnet(var.cidr, 8, 201)
            az   = data.aws_availability_zones.this.names[1]
        },
        {
            cidr = cidrsubnet(var.cidr, 8, 202)
            az   = data.aws_availability_zones.this.names[2]
        },
    ]
}