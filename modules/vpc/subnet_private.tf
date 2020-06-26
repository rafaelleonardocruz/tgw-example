
resource "aws_subnet" "private" {
  count = length(local.private_subnets)

  vpc_id     = aws_vpc.this.id
  cidr_block = local.private_subnets[count.index].cidr
  
  availability_zone = local.private_subnets[count.index].az

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.name}-private-${local.private_subnets[count.index].az}"
    Rule = "private"
    Environment = var.name
    Terraform = "true"
  }
}

resource "aws_route_table" "private" {
  count = length(local.private_subnets)

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-private-${local.private_subnets[count.index].az}"
    Rule = "private"
    Environment = var.name
    Terraform = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "private" {
  count = length(local.private_subnets)
  
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id

  lifecycle {
    create_before_destroy = true
  }
}
