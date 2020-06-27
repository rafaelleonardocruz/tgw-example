resource "aws_ec2_transit_gateway_route" "this" {
  for_each = data.aws_vpc.this

  destination_cidr_block         = each.value.cidr_block
  blackhole                      = true
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.this.id
}