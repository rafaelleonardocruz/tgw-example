resource "aws_ec2_transit_gateway_route_table" "shared-services" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "SharedServices"
    Environment = "sharedservices"
  }
}

resource "aws_ec2_transit_gateway_route_table" "production" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "Production"
    Environment = "prod"
  }
}

resource "aws_ec2_transit_gateway_route_table" "staging" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "Staging"
    Environment = "stg"
  }
}

resource "aws_ec2_transit_gateway_route_table" "development" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "Development"
    Environment = "dev"
  }
}