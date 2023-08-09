resource "aws_security_group" "internet-access" {
  name   = "ALL Traffic"
  vpc_id = var.vpc_id
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
      to_port     = port.value
      from_port   = port.value
      protocol    = var.dynamic_protocol
      cidr_blocks = var.block
    }
  }
  ingress {
    from_port   = var.ports
    to_port     = var.ports
    protocol    = var.protocol
    cidr_blocks = var.vpc_cidr
  }
  egress {
    from_port   = var.ports
    to_port     = var.ports
    protocol    = var.protocol
    cidr_blocks = var.block
  }
}


module "asg" {
  source              = "terraform-aws-modules/autoscaling/aws"
  version             = "4.9.0"
  name                = var.name
  vpc_zone_identifier = var.subnets
  security_groups     = [""]
  min_size            = var.min
  max_size            = var.max
  desired_capacity    = var.min
  key_name            = var.key
  use_lt              = var.enable
  create_lt           = var.enable
  image_id            = var.ami
  instance_type       = var.type
  user_data           = file("script.sh")
  tags_as_map = {
    Name = var.name
  }
}