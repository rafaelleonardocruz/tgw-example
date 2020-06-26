data "aws_availability_zones" "this" {
  state = "available"
}

data "aws_region" "current" {}

resource "aws_ec2_transit_gateway" "this" {
  description = "tgw-${data.aws_region.current.name}"

  amazon_side_asn = var.asn
  
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name = "tgw-${data.aws_region.current.name}"
  }
}

output "tgw_arn" {
  value = aws_ec2_transit_gateway.this.arn
}
output "tgw_owner_id" {
  value = aws_ec2_transit_gateway.this.owner_id
}
output "tgw_id" {
  value = aws_ec2_transit_gateway.this.id
}
output "tgw_region" {
  value = data.aws_region.current.name
}
