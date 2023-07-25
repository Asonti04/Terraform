provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    ami = "ami-05548f9cecf47b442"
    instance_type = "t2.micro"
    
    subnet_id =  "subnet-"
    vpc_security_group_ids = ["sg-"]
    
    tags = {
        "Identity" = "Terraform_creation"
    }
}