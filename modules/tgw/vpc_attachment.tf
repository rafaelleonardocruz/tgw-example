module "vpc_attach" {
    source = "../vpc-tgw-attach"
    count = length(var.vpc_to_attach)

    depends_on = [
        aws_ec2_transit_gateway.this,
        aws_ec2_transit_gateway_route_table.production,
        aws_ec2_transit_gateway_route_table.staging,
        aws_ec2_transit_gateway_route_table.development,
    ]

    name = var.vpc_to_attach[count.index]
    tgw_id = aws_ec2_transit_gateway.this.id
}