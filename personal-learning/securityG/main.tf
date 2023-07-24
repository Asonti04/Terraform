provider "aws" {
    region = "us-east-1"
}

variable "name" {
    type = string
    default = "terraform"
}

resource "aws_instance" "ec2" {
  ami                     = "ami-05548f9cecf47b442"
  instance_type           = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  
  tags = {
      Name = var.name
    }
  }
  
resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}