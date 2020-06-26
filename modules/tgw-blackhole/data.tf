data "aws_ec2_transit_gateway_route_table" "this" {
  filter {
    name   = "tag:Environment"
    values = [var.env]
  }
}

data "aws_vpcs" "this" {
  filter {
      name = "tag:Environment"
      values = var.envs_to_deny
  }
}

data "aws_vpc" "this" {
  count = length(data.aws_vpcs.this.ids)
  id = element(data.aws_vpcs.this.ids, count.index)
}