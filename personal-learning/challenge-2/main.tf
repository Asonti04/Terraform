resource "aws_instance" "DB" {
  ami  = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
}

output "privateip" {
  value = aws_instance.DB.private_ip
}

resource "aws_instance" "webserver" {
  ami            = "ami-0f34c5ae932e6f0e4"
  instance_type           = "t2.micro"
  security_groups = [aws_security_group.sg.name]
  user_data      = file("script.sh")
}

resource "aws_security_group" "sg" {
  name   = "challege2"
  vpc_id = "vpc-080c75941a31b1ae0"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }



}