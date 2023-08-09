variable "vpc_id" {
  type    = string
  default = "vpc-080c75941a3ae0"
}
variable "subnets" {
  type    = list(string)
  default = ["subnet-0499eedac98a", "subnet-023d79c233bf"]
}
variable "ami" {
  type    = string
  default = "ami-09538990a0c4fe9be"
}
variable "name" {
  type    = string
  default = "week21project"
}
variable "type" {
  type    = string
  default = "t2.micro"
}
variable "ingressrule" {
  type    = list(number)
  default = [80, 443, 22]
}
variable "block" {
  default = ["0.0.0.0/0"]
}
variable "ports" {
  type    = number
  default = 0
}
variable "enable" {
  default = true
}
variable "protocol" {
  type    = string
  default = "-1"
}
variable "dynamic_protocol" {
  type    = string
  default = "TCP"
}
variable "vpc_cidr" {
  default = ["172.31.0"]
}
variable "max" {
  type    = number
  default = 5
}
variable "min" {
  type    = number
  default = 2
}
variable "key" {
  type    = string
  default = "d"
}