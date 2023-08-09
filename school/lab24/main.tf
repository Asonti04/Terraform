resource "aws_instance" "aws_linux" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  tags          = local.common_tags
}
locals {
  service_name = "Automation"
  app_team     = "Cloud Team"
  createdby    = "terraform"
  common_tags = {
    Service   = local.service_name
    AppTeam   = local.app_team
    CreatedBy = local.createdby
  }
}