variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "allowed_regions" {
    description = "set of allowed AWS Regions"
    type = set(string)
    default = ["us-east-1", "us-west-2", "eu-west-1", "eu-west-1"]
}

variable "allowed_vm_types" {
    description = "List of allowed EC2 VM types"
    type = list(string)
    default = ["t2.samll", "t2.micro", "t3.small", "t3.micro"]
}

variable "tags" {
    type = map(string)
    default = {
        Environment = "dev"
        Name = "dev-Instance"
        created_by = "terraform"
    }
}