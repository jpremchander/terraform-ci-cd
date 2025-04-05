output "instance_id" {
  value = aws_instance.practicallab4_ec2_server.id
}

output "public_ip" {
  value = aws_instance.practicallab4_ec2_server.public_ip
}
