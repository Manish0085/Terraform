terraform {

  backend "s3" {
    bucket = "manish0085-terraform-st"
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



# Creating variables
 
variable "environment" {
    default = "dev"
    # type = string
}

variable "github_user" {
    default = "manish0085" 
}

variable "region" {
    default = "us-east-1"
}

locals {
    bucket_name = "${var.github_user}-bucket-${var.environment}-${var.region}"
    vpc_name = "${var.environment}-VPC"
}




resource "aws_s3_bucket" "second-bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}


resource "aws_vpc" "sample_vpc" {
  cidr_block       = "10.0.0.0/16"
  region = var.region
  # instance_tenancy = "default"

  tags = {
    Environment = var.environment
    Name = local.vpc_name
  }
}

resource "aws_instance" "example" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"
  region = var.region

  tags = {
    Environment = var.environment
    Name = "Dev-EC2-Instance"
  }
}



# Output variable

output "vpc_id" {
    value = aws_vpc.sample_vpc.id
}

output "ec2_id" {
    value = aws_instance.example.id
}
