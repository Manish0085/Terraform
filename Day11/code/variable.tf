
variable "project_name" {
    default = "Project Alpha Resource"
}


variable "default_tags" {
    default = {
        company = "TechCorp"
        managed_by = "terraform"
    }
}

variable "production_tags" {
    default = {
        environment = "production"
        cost_center = "cc-123"
    }
}

variable "bucket_name" {
    default = "ProjectAlphaStorageBucket with CAPS and Spaces!!!"
}

variable "allowed_ports" {
    default = "80, 443, 8080, 3306"
}


variable "instance_sizes" {
    default = {
        dev = "t2.micro"
        stage = "t3.micro"
        prod = "t3.large"
    }
}



variable "allowed_vm_types" {
    description = "Allowed AWS Instance type"
    type = list(string)
    default = ["t2.micro", "t2.small", "t3.micro", "t3.small"]
}

variable "tags" {
    type = map(string)
    default = {
        Environment = "Dev"
        Name = "dev-Instance"
        created_by = "terraform"
    }
}

variable "instance_count" {
    description = "Number of instance to be created"
    type = number
}

variable "environment" {
    description = "Application Environment" 
    type = string
    default = "dev"
}

variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "ingress_rules" {
    description = "List of ingress rules for security group"
    type = list(object({
        from_port         = number
        to_port           = number
        protocol          = string
        cidr_blocks       = list(string)
        description       = string
    }))
    default = [
        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "HTTP"
        },
        {
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "HTTPS"
        }
    ]
}