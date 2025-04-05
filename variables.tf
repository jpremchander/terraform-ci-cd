variable "region" {
  default = "ca-central-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1a_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_1b_cidr" {
  default = "10.0.2.0/24"
}

variable "db_username" {
  default = "pgadmin"
}

variable "db_password" {
  default = "pgadmin2k25"
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  default = 5
}
