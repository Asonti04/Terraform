resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}
resource "aws_subnet" "list_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.200.0/24"
  availability_zone = var.us-east-1-azs
}
