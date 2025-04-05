Terraform Practical Lab 10 with github workflow terraform ci cd
Description:
The project demonstrates advanced capabilities of Terraform, such as loops (count and for_each), functions, expressions, and modular configurations. The infrastructure configuration provided includes the following key components:

Multiple EC2 Instances launched using loops (count and for_each).

Dynamic ingress and egress rules in security groups.

VPC Configuration with internet gateway, subnets, and route tables.

ALB (Application Load Balancer) for routing traffic to EC2 instances.

RDS (Relational Database Service) setup with security group and subnet groups.

Use of Terraform built-in functions for greater automation, flexibility, and reusability.

Prerequisites:
Terraform CLI installed.

AWS credentials configuration (using AWS CLI or environment variables).

Familiarity with Terraform fundamentals (e.g., providers, resources, modules, and state).

Project Structure:
graphql
Copy
/Practical-Lab-8/
  ├── main.tf                # Main configuration to tie everything together
  ├── variables.tf           # Main variables, e.g., VPC CIDR, EC2 configurations, etc.
  ├── def.tfvars             # Default variables
  ├── outputs.tf             # Outputs, like instance IDs and ALB DNS
  ├── modules/               # Modular code for EC2, security, VPC, ALB, and RDS
  │   ├── ec2/               # Module to spin up multiple EC2 instances
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   ├── security/          # Security module to create security groups
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   ├── vpc/               # Module for creating VPC, subnets, and IGW
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   ├── alb/               # Module for Application Load Balancer creation
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   ├── rds/               # Module for RDS instance creation
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  ├── README.md              # Project Description
Terraform Commands to Execute:
Initialize Terraform Configurations in the backend:

bash
Copy
terraform init
Plan infrastructure for your AWS Provider based on the configuration scripts:

bash
Copy
terraform plan
Apply the configuration to create the resources:

bash
Copy
terraform apply
Destroy the resources when complete (Optional – if any modifications or to clean out):

bash
Copy
terraform destroy
Terraform Loops (count and for_each)
count:
Used to create multiple similar resources, like EC2 instances.

Example:

hcl
Copy
resource "aws_instance" "example" {
  count         = 3
  ami           = var.ami_id
  instance_type = var.instance_type
}
for_each:
Used to create dynamic resources from a map or set of values.

Example:

hcl
Copy
resource "aws_security_group" "sg" {
  for_each = var.security_group_rules
  name_prefix = each.key
  vpc_id      = var.vpc_id
  ingress {
    from_port   = each.value.from_port
    to_port     = each.value.to_port
    protocol    = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
  }
}
Functions in Terraform Configurations
String Functions:
upper(): Converts all input strings to uppercase.

lower(): Converts all input strings to lowercase.

Numeric Functions:
min(): Returns the lowest of a series of numbers.

max(): Returns the maximum value from a list of numbers.

Collection Functions:
concat(): Merges several lists or sets into a single list.

length(): Returns the length of a list, string, or map.

Networking Functions:
cidrsubnet(): Generates a new subnet within a given CIDR block.

Example:

hcl
Copy
locals {
  new_subnet_cidr = cidrsubnet(var.cidr_block, 8, 1)
}
RDS (Relational Database Service) Module
The RDS module is responsible for:

Creating an RDS PostgreSQL instance with necessary security configurations.

Attaching an RDS security group with controlled ingress/egress rules.

Placing the RDS instance within the correct subnet group.

Sample RDS Configuration:
hcl
Copy
resource "aws_db_instance" "rds_instance" {
  identifier              = "rds-instance"
  engine                  = "postgres"
  engine_version          = "16.3"
  instance_class          = "db.t3.micro"
  allocated_storage       = 5
  username                = "pgadmin"
  password                = "pgadmin2k25"
  publicly_accessible     = true
  vpc_security_group_ids  = [module.security.rds_security_group_id]
  db_subnet_group_name    = "public-db-subnet-group"
}
Lessons Learned:
Terraform Functions:
Using functions in Terraform can automate tasks, simplify code, and improve reusability. For example, the use of join(), max(), min(), and concat() simplifies variable management and resource allocation.

Modularization:
Modularizing Terraform configurations promotes organization and modularity. It helps in reusing code blocks for different parts of the infrastructure (e.g., EC2, VPC, ALB, RDS).

ALB:
The Application Load Balancer module is crucial in distributing traffic across multiple EC2 instances, ensuring better availability and scalability.

RDS Security:
Managing RDS security groups separately ensures that database access is tightly controlled and not exposed publicly without necessary restrictions.

Repository:
[GitHub Repo Link - https://github.com/jpremchander/PROG8830.git]

Created By:
Group 2

Prem Chander Jebastian
Rishi Patel
Twinkle Mishra