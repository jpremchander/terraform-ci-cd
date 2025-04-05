output "vpc_id" {
  value = aws_vpc.prod_vpc.id
}

output "db_instance_endpoint" {
  value = aws_db_instance.postgres_db.endpoint
}
