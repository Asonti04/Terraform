provider "aws" {
    region = "us-east-1"
}

variable "name" {
    type = string
    default = "terraform_tester"
}

resource "aws_instance" "ec2" {
  ami                     = "ami-05548f9cecf47b442"
  instance_type           = "t2.micro"
  tags = {
      Name = var.name
    }
  }