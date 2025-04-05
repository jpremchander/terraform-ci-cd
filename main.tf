module "vpc" {
  source         = "./modules/vpc"
  cidr_block     = var.cidr_block
  subnet_cidr_1a = var.subnet_cidr_1a
  subnet_cidr_1b = var.subnet_cidr_1b
}

module "security" {
  source              = "./modules/security"
  vpc_id              = module.vpc.vpc_id
  allowed_cidr_blocks = var.allowed_cidr_blocks
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.subnet_1a_id  # Use the output subnet_1a_id
  security_group_id = module.security.ec2_security_group_id  # Use the output security group id
  key_name          = var.key_name
  allowed_cidr_blocks = var.allowed_cidr_blocks
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage       = var.db_storage
  instance_class          = var.db_instance_class
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = module.security.rds_security_group_id  # Use the output security group id for RDS
  publicly_accessible     = var.publicly_accessible
  parameter_group_name    = var.db_parameter_group_name
  identifier              = var.db_identifier
  multi_az                = var.multi_az
  backup_retention_period = var.backup_retention_period
  storage_type            = var.storage_type
  apply_immediately       = var.apply_immediately
}
