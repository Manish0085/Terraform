

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
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
