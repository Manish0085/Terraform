terraform {

  backend "s3" {
    bucket = "manish0085-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "second-bucket" {
  bucket = "manish0085-s3-bucket-002"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}