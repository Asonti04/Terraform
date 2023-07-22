provider "aws" {
    region = "us-east-1"
}

variable name {
    type = string
    default = "challenge"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "192.168.0.0/24"
    
    tags = {
        Name = var.name
    }
}