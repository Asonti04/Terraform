variable "ec2name" {
    type = string
}
resource "aws_instance" "ec2" {
  ami                     = "ami-05548f9cecf47b442"
  instance_type           = "t2.micro"
  tags = {
      Name = var.ec2name
  }
 
  }