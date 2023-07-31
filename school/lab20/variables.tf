variable "private_subnets" {
  default = {
  "private_subnet_1" = 1
  "private_subnet_2" = 2
  "private_subnet_3" = 3
}
}
variable "availability_zone" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  }