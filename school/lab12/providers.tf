terraform {
required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.9.0"
    }
    tls = {
        source = "hashicorp/tls"
        version = "4.0.4"
    }
    local = {
        source = "hashicorp/local"
        version = "2.4"
    }
}
}