variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "The VPC subnet ID to launch the EC2 instance in"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to assign to the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair to associate with the instance"
  type        = string
  default     = ""
}
