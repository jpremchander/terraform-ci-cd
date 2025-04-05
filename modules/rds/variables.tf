variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
}

variable "db_family" {
  description = "The DB engine family"
  type        = string
}

variable "db_identifier" {
  description = "The DB instance identifier"
  type        = string
}

variable "db_engine_version" {
  description = "The DB engine version"
  type        = string
}

variable "db_instance_class" {
  description = "The DB instance class"
  type        = string
}

variable "db_storage" {
  description = "The allocated storage for the DB instance"
  type        = number
}

variable "db_username" {
  description = "The DB username"
  type        = string
}

variable "db_password" {
  description = "The DB password"
  type        = string
  sensitive   = true
}

variable "vpc_security_group_ids" {
  description = "The VPC security group IDs for the DB instance"
  type        = list(string)
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
}
