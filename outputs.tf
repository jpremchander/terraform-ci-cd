# outputs.tf (Root)

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_instance_id" {
  value = module.rds.db_instance_id
}
