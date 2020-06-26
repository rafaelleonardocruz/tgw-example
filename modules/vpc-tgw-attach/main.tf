data "aws_vpc" "this" {
  tags = {
      Name = var.name
  }
}

data "aws_subnet_ids" "this" {
  vpc_id = data.aws_vpc.this.id

  tags = {
    Rule = "attachment"
  }
}

data "aws_ec2_transit_gateway_route_table" "this" {
  filter {
    name   = "tag:Environment"
    values = [var.name]
  }

  filter {
    name   = "transit-gateway-id"
    values = [var.tgw_id]
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids         = data.aws_subnet_ids.this.ids
  transit_gateway_id = var.tgw_id 
  vpc_id             = data.aws_vpc.this.id
  
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
      Name = var.name
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.this.id
}