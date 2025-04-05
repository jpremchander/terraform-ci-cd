# modules/ec2/main.tf

resource "aws_security_group" "ec2_sg" {
  name_prefix = "ec2-sg-"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }
}

resource "aws_instance" "ec2_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
  key_name        = var.key_name
  user_data = <<-EOF
  #!/bin/bash
  yum install -y httpd
  echo "Hello from Group2!" > /var/www/html/index.html
  systemctl start httpd
  systemctl enable httpd
  EOF

  tags = {
    Name = "PracticalLab9-EC2-Server"
  }
}