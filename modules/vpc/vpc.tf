resource "aws_vpc" "this" {
  cidr_block = var.cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.name
    Environment = var.name
    Terraform = "true"
  }
}