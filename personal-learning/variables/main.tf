provider "aws" {
    region = "us-east-1"
}

variable "vpcname" {
    type = string
    default = "mytfvpc"
}

variable "ssh" {
    type = number
    default = 22
}

variable "enable" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["Value1", "Value2"]
}

variable "mymap" {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
}

variable "inputname" {
    type = string
    description = "Set the Vpc name"
}

resource "aws_vpc" "mytfvpc" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = var.inputname
    }
}

output "VPCID" {
    value = aws_vpc.mytfvpc.id
}

variable "mytuple" {
    type = tuple([string, number, string])
    default = ["dog", 4, "pig"]
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "sonti"
        port = [22,80,8080]
    }
}