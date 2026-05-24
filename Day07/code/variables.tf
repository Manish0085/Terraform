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
    type = string
}


variable "instance_count" {
    description = "Number of EC2 instances to create"
    default = 1
    type = number
}

variable "monitoring_enabled" {
    description = "Enabled deatiled monitoring for EC2 Instance"
    type = bool
    default = true
}


variable "associate_public_ip_address" {
    description = "Associate public IP address with EC2 instances"
    type = bool
    default = true
}

variable "cidr_block" {
    description = "CIDR block for EC2"
    type = list(string)
    default = ["10.0.0.0/8", "192.168.0.0/16", "176.16.0.0/12"]
}


variable "allowed_vm_type" {
    description = "List of allowed VM types"
    type = list(string)
    default = ["t2.samll", "t2.micro", "t3.samll", "t3.small"]
}


variable tags {
    type = map(string)
    default = {
        Environment = "Dev"
        Name = "Dev-EC2-Instance"
        created_by = "terraform"
    }
}


variable "ingress_value" {
    type = tuple([number, string, number])
    default = [443, "tcp", 443]
}

variable "config" {
    type = object({
        region = string,
        monitoring = bool,
        instance_count = number
    })
    default = {
        
        region = "us-east-1"
        monitoring = true
        instance_count = 1
    }
}



