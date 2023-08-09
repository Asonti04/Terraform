terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "asonti-week21"
    key    = "state"
    region = "us-east-1"
  }
}
