resource "aws_db_subnet_group" "default" {
  name        = "rds-subnet-group"
  subnet_ids  = var.subnet_ids
  description = "RDS DB Subnet Group"
}

resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }
}


resource "aws_db_instance" "rds_instance" {
  allocated_storage       = var.db_storage
  instance_class          = var.instance_class        # Correct attribute
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  publicly_accessible     = var.publicly_accessible
  parameter_group_name = var.db_parameter_group_name
  identifier = var.db_identifier
  #db_parameter_group_name = var.db_parameter_group_name
  #db_identifier           = var.db_identifier
  multi_az                = var.multi_az
  backup_retention_period = var.backup_retention_period
  storage_type            = var.storage_type
  apply_immediately       = var.apply_immediately
}
