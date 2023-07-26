variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
    "private_subnet_3" = 3
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }
}

variable "variables_sub_cidr" {
  description = "CIDR Block for the Variables Subnet"
  default     = "10.0.202.0/24"
  type        = string
}

variable "variables_sub_az" {
  description = "Availability Zone used Variables subnet"
  default     = "us-east-1a"
  type        = string
}

variable "variables_sub_auto_ip" {
  description = "Set Automatic IP Assignment for variables subnet"
  default     = true
  type        = bool
}

variable "environment" {
  description = "Deployment ENV"
  type        = string
  default     = "dev"
}