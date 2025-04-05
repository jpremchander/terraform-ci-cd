# Outputs for VPC module
output "subnet_1a_id" {
  value = aws_subnet.subnet_1a.id
}

output "subnet_1b_id" {
  value = aws_subnet.subnet_1b.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
