# 🔹 Outputs (Module-specific naming)

# VPC Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_1a_id" {
  value = module.vpc.subnet_1a_id
}

output "subnet_1b_id" {
  value = module.vpc.subnet_1b_id
}

# Security Group Outputs
output "lb_sg_id" {
  value = module.security.lb_security_group_id
}

output "ec2_sg_id" {
  value = module.security.ec2_security_group_id
}

# EC2 Instance Outputs
output "instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

# ALB Outputs
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_arn" {
  value = module.alb.alb_arn
}

# RDS Outputs
output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "rds_instance_id" {
  value = module.rds.db_instance_id
}
