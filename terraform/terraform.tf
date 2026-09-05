terraform {
    required_providers {
        aws={
            source = "hashicorp/aws"
            version = "6.38.0"
            }
        }

    backend "s3" {
        bucket = "e-commerce-project-remote-bucket11"
        key = "terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "e-commerce-project-remote-table11"
        }
}