resource "aws_subnet" "public" {
  count = length(local.public_subnets)

  vpc_id     = aws_vpc.this.id
  cidr_block = local.public_subnets[count.index].cidr
  
  availability_zone = local.public_subnets[count.index].az

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.name}-public-${local.public_subnets[count.index].az}"
    Rule = "public"
    Environment = var.name
    Terraform = "true"
  }
}

resource "aws_route_table" "public" {
  count = length(local.public_subnets)

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-public-${local.public_subnets[count.index].az}"
    Rule = "public"
    Environment = var.name
    Terraform = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "public" {
  count = length(local.public_subnets)
  
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-vpc-${aws_vpc.this.id}"
    Rule = "public"
    Environment = var.name
    Terraform = "true"
  }
}

resource "aws_route" "internet" {
  count = length(local.public_subnets)

  route_table_id         = aws_route_table.public[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}