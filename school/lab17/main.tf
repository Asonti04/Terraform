provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "aws_linux" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"
}
