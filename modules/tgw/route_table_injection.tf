data "aws_vpc" "prod" {
  tags = {
      Name = "prod"
  }
}

data "aws_route_tables" "prod" {
  vpc_id = data.aws_vpc.prod.id

  filter {
    name   = "tag:Environment"
    values = ["prod"]
  }
  filter {
    name   = "tag:Rule"
    values = ["private", "attachment"]
  }
}

resource "aws_route" "prod_default" {
  count = length(tolist(data.aws_route_tables.prod.ids))

  route_table_id            = tolist(data.aws_route_tables.prod.ids)[count.index]
  destination_cidr_block    = "0.0.0.0/0"
  transit_gateway_id        = aws_ec2_transit_gateway.this.id

  depends_on = [
    module.vpc_attach,
  ]
}

### 

data "aws_vpc" "dev" {
  tags = {
      Name = "dev"
  }
}

data "aws_route_tables" "dev" {
  vpc_id = data.aws_vpc.dev.id

  filter {
    name   = "tag:Environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:Rule"
    values = ["private", "attachment"]
  }
}

resource "aws_route" "dev_default" {
  count = length(tolist(data.aws_route_tables.dev.ids))

  route_table_id            = tolist(data.aws_route_tables.dev.ids)[count.index]
  destination_cidr_block    = "0.0.0.0/0"
  transit_gateway_id        = aws_ec2_transit_gateway.this.id

  depends_on = [
    module.vpc_attach,
  ]
}

####
data "aws_vpc" "stg" {
  tags = {
      Name = "stg"
  }
}

data "aws_route_tables" "stg" {
  vpc_id = data.aws_vpc.stg.id

  filter {
    name   = "tag:Environment"
    values = ["stg"]
  }
  filter {
    name   = "tag:Rule"
    values = ["private", "attachment"]
  }
}

resource "aws_route" "stg_default" {
  count = length(tolist(data.aws_route_tables.stg.ids))

  route_table_id            = tolist(data.aws_route_tables.stg.ids)[count.index]
  destination_cidr_block    = "0.0.0.0/0"
  transit_gateway_id        = aws_ec2_transit_gateway.this.id

  depends_on = [
    module.vpc_attach,
  ]
}