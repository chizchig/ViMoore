resource "aws_vpc" "vpc" {
  for_each = var.vpc_configs

  cidr_block       = each.value.cidr_block
  instance_tenancy = each.value.instance_tenancy
}

resource "aws_internet_gateway" "igw" {
  for_each = aws_vpc.vpc

  vpc_id = each.value.id
  tags = {
    name = "${each.key}-igw"
  }
}