provider "aws" {
    region = "us-east-1"
}

resource "random_string" "random" {
    length = 10
}