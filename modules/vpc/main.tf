# modules/vpc/main.tf

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_1a
}

resource "aws_subnet" "subnet_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_1b
}