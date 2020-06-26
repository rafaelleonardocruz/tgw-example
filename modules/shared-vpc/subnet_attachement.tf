
resource "aws_subnet" "attachment" {
  count = length(local.attachment_subnets)

  vpc_id     = aws_vpc.this.id
  cidr_block = local.attachment_subnets[count.index].cidr
  
  availability_zone = local.attachment_subnets[count.index].az

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.name}-attachment-${local.attachment_subnets[count.index].az}"
    Rule = "attachment"
    Environment = var.name
    Terraform = "true"
  }
}

resource "aws_route_table" "attachment" {
  count = length(local.attachment_subnets)

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-attachment-${local.attachment_subnets[count.index].az}"
    Rule = "attachment"
    Environment = var.name
    Terraform = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "attachment" {
  count = length(local.attachment_subnets)
  
  subnet_id      = aws_subnet.attachment[count.index].id
  route_table_id = aws_route_table.attachment[count.index].id

  lifecycle {
    create_before_destroy = true
  }
}
