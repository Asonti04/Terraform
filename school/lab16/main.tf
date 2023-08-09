provider "aws" {
    region = "us-west-1"
}
resource "aws_instance" "aws_linux" {
    ami = "ami-0c38b9e37c107d921"
    instance_type = "t2.micro"
}
