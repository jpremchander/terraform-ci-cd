cidr_block           = "10.0.0.0/16"
subnet_cidr_1a       = "10.0.1.0/24"
subnet_cidr_1b       = "10.0.2.0/24"
ami_id               = "ami-02cd5b9bfb2512340"
instance_type        = "t3.micro"
key_name             = "dev-key"
allowed_cidr_blocks  = ["0.0.0.0/0"]

# RDS DB variables
db_storage           = 20  # 20GB of storage for the DB instance
instance_class       = "db.t3.micro"  # Replace with your desired instance class
db_instance_class = "db.t3.micro"
db_engine            = "postgres"  # For PostgreSQL DB Engine
db_engine_version    = "15.12"
db_username          = "pgadmin"
db_password          = "StrongPassword2k25"  # Replace with your actual password
db_name              = "practicallab-9"
vpc_security_group_ids = [aws_security_group.ec2_sg.id]  # Dynamically referencing EC2 security group
publicly_accessible  = false
db_parameter_group_name = "default.postgres15"
db_identifier        = "practicallab-9-db-instance"
multi_az             = false  # Set to true if you want multi-AZ deployment
backup_retention_period = 7  # Number of days to retain backups
storage_type         = "gp3"  # General Purpose SSD
apply_immediately    = true  # Apply changes immediately to the DB instance

# Use RDS security group for RDS
rds_security_group_ids = [aws_security_group.rds_sg.id]  # Dynamically referencing RDS security group
subnet_ids         = [var.vpc.subnet_1a_id, var.vpc.subnet_1b_id]
