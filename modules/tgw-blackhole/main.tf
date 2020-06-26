resource "aws_ec2_transit_gateway_route" "this" {
  count = length(data.aws_vpcs.this)

  destination_cidr_block         = data.aws_vpc.this[count.index].cidr_block
  blackhole                      = true
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.this.id
}