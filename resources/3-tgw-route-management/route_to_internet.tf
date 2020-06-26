#data "aws_ec2_transit_gateway_vpc_attachment" "environments" {
#  filter {
#    name   = "tag:Environment"
#    values = ["prod","dev","staging"]
#  }
#
#  depends_on = [
#    module.vpc_attach
#  ]
#}
#
#data "aws_ec2_transit_gateway_vpc_attachment" "shared-services" {
#  filter {
#    name   = "tag:Environment"
#    values = ["shared-services"]
#  }
#
#  depends_on = [
#    module.vpc_attach
#  ]
#}
#
#resource "aws_ec2_transit_gateway_route_table_propagation" "internet" {
#  count = length(data.aws_ec2_transit_gateway_vpc_attachment.environments.id)
#
#  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpc_attachment.environments.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.shared-services.id
#}
#
#resource "aws_ec2_transit_gateway_route" "internet_prod" {
#  destination_cidr_block         = "0.0.0.0/0"
#  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpc_attachment.shared-services.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.production.id
#}
#
#resource "aws_ec2_transit_gateway_route" "internet_stg" {
#  destination_cidr_block         = "0.0.0.0/0"
#  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpc_attachment.shared-services.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.staging.id
#}
#
#resource "aws_ec2_transit_gateway_route" "internet_dev" {
#  destination_cidr_block         = "0.0.0.0/0"
#  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpc_attachment.shared-services.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.development.id
#}