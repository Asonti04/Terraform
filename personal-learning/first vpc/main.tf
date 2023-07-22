# create a VPC
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "mytfvpc" {
    cidr_block = "10.0.0.0/16"
}
