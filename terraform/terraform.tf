terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.59.0"
    }
  }

  backend "s3" {
    bucket         = "e-commerce-project-remote-bucket11"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile = true
  }
}