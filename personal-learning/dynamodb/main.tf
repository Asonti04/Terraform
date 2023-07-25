provider "aws" {
    region = "us-east-1"
}

resource "aws_dynamodb_table" "table" {
    name  = "Mountains"
    read_capacity = 20
    write_capacity = 20 
    hash_key = "Mountain"
    range_key = "Elevation"
    
    attribute {
        name = "Mountain"
        type = "S"
    }
    attribute {
        name = "Elevation"
        type = "N"
    }
}