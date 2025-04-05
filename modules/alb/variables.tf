variable "vpc_id" {
  description = "The VPC ID in which to create the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The security group IDs associated with the ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "The port for the ALB listener"
  type        = number
  default     = 80
}

variable "target_group_port" {
  description = "The port for the target group"
  type        = number
  default     = 80
}
