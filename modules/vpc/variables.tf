# modules/vpc/variables.tf

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_1a" {
  description = "The CIDR block for the first subnet"
  type        = string
}

variable "subnet_cidr_1b" {
  description = "The CIDR block for the second subnet"
  type        = string
}
