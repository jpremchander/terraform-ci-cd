provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  tags = {
    Name = "PracticalLab-10"
  }
}
