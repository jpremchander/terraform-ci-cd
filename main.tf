provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "prod_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "prod_vpc"
  }
}

# Public Subnet in Availability Zone 1a
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.prod_vpc.id
  cidr_block              = var.public_subnet_1a_cidr
  availability_zone       = "ca-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1a"
  }
}

# Public Subnet in Availability Zone 1b
resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.prod_vpc.id
  cidr_block              = var.public_subnet_1b_cidr
  availability_zone       = "ca-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1b"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "prod-igw"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Route Table with Public Subnet
resource "aws_route_table_association" "public_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for RDS"
  vpc_id      = aws_vpc.prod_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}

# DB Subnet Group with Subnets in Multiple AZs.
resource "aws_db_subnet_group" "public_subnet_group" {
  name = "public-db-subnet-group"
  subnet_ids = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1b.id
  ]

  tags = {
    Name = "public-db-subnet-group"
  }
}

# RDS Parameter Group
resource "aws_db_parameter_group" "parameter_group" {
  name   = "default-postgresql16"
  family = "postgres16"
}

# RDS Instance
resource "aws_db_instance" "postgres_db" {
  identifier             = "localpostgresdb"
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.public_subnet_group.name
  parameter_group_name   = aws_db_parameter_group.parameter_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = true
  skip_final_snapshot    = true

  tags = {
    Name = "postgres-db-instance"
  }
}