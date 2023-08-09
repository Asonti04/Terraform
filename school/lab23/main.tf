resource "random_pet" "server" {
  length = 2
}
module "s3-bucket_example_complete" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.14.1"
}

resource "aws_vpc" "vpc" {
  cidr_block = "172.24.0.0/24"
  tags = {
    Name        = "VPC"
    Environment = "test"
    Terraform   = "true"
  }
}

resource "tls_private_key" "generated" {
  algorithm = "RSA"
}
resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "G:/RANDOM/MyAWSKey.pem"
}

resource "aws_instance" "web_" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  tags = {
    Name = "web"
  }
}