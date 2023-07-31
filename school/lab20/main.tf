
module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "4.9.0"
  # Autoscaling group
  name = "myasg"
  availability_zone = var.availability_zone
  min_size         = 0
  max_size         = 1
  desired_capacity = 1
  # Launch template
  use_lt        = true
  create_lt     = true
  image_id      = "ami-0f34c5ae932e6f0e4"
  instance_type = "t3.micro"
  tags_as_map = {
    Name = "Web EC2 Server 2"
  }
}

output "asg_group_size" {
    value = module.autoscaling.autoscaling_group_max_size
}