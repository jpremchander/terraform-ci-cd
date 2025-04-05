variable "subnet_ids" {
  description = "List of subnet IDs for the DB instance"
  type        = list(string)
}

variable "db_instance_class" {
  description = "The DB instance class"
  type        = string
}

variable "db_engine" {
  description = "The DB engine (e.g., mysql, postgres)"
  type        = string
}

variable "db_engine_version" {
  description = "The DB engine version"
  type        = string
}

variable "db_username" {
  description = "The RDS database username"
  type        = string
}

variable "db_password" {
  description = "The RDS database password"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security group IDs to associate with the DB instance"
  type        = list(string)
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
}

variable "db_parameter_group_name" {
  description = "The DB parameter group name"
  type        = string
}

variable "db_identifier" {
  description = "The DB instance identifier"
  type        = string
}

variable "multi_az" {
  description = "Whether to create a multi-AZ deployment"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "storage_type" {
  description = "The storage type for the DB instance"
  type        = string
  default     = "gp2"
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately"
  type        = bool
  default     = true
}

variable "db_storage" {
  description = "The allocated storage (in gigabytes) for the DB instance"
  type        = number
}

variable "instance_class" {
  description = "The instance class for the DB instance"
  type        = string
}

variable "allowed_cidr_blocks" {
  type = list(string)
}