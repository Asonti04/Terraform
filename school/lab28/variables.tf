variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"

}
variable "us-east-1-azs" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1e"
  ]
}

variable "environment" {
  description = "Deployment ENV"
  type        = string
  default     = "dev"
}
variable "env" {
  type = map(any)
  default = {
    prod = {
      ip = "10.0.150.0/24"
      az = "us-east-1a"
    }
    dev = {
      ip = "10.0.250.0/24"
      az = "us-east-1e"
    }
  }
}
variable "num_1" {
  type        = number
  description = "Numbers for function labs"
  default     = 88
}
variable "num_2" {
  type        = number
  description = "Numbers for function labs"
  default     = 73
}
variable "num_3" {
  type        = number
  description = "Numbers for function labs"
  default     = 52
}

variable "web_ingress" {
  type = map(object(
    {
      description = string
      port        = number
      protocol    = string
      cidr_blocks = list(string)
    }
  ))
  default = {
    "80" = {
      description = "Port 80"
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "443" = {
      description = "Port 443"
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
