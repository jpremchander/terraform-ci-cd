# modules/security/variables.tf

variable "vpc_id" {
  description = "The VPC ID to create security groups"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks"
  type        = list(string)
}
