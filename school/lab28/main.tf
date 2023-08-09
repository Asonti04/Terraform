data "aws_s3_bucket" "data_bucket" {
  bucket = "asonti"
}
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = lower("TERRAFORM")
    Environment = upper(var.environment)
    Terraform   = upper("true")
  }
  enable_dns_hostnames = true

}
resource "aws_subnet" "list_subnet" {
  for_each          = var.env
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.ip
  availability_zone = each.value.az
}

resource "aws_iam_policy" "policy" {
  name        = "data_bucket_policy"
  description = "Allow access to my bucket"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:Get*",
          "s3:List*"
        ],
        "Resource" : "${data.aws_s3_bucket.data_bucket.arn}"
      }
    ]
  })
}

resource "aws_security_group" "main" {
  name   = "core-sg-world"
  vpc_id = aws_vpc.vpc.id
  dynamic "ingress" {
    for_each = var.web_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  lifecycle {
    create_before_destroy = true
  }
  
}
