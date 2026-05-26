resource "aws_instance" "example" {
    ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
    instance_type = var.allowed_vm_types[2]
    region = var.region

    tags = var.tags

    lifecycle {
        ignore_changes = [ tags, ami, instance_type ]
        # prevent_destroy = true
        # create_before_destroy = true
    }

}


data "aws_ami" "amazon_linux_2" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_security_group" "app_sg" {
  # ... other configuration ...

  name = "new-app-security-group"
  description = "Security group for application servers"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = merge(
    var.tags,
    {
      Name = "App Security Group"
      Demo = "replace_triggered_by"
    }
  )

}


resource "aws_instance" "app_with_sg" {
     ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.allowed_vm_types[3]
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = merge(
    var.tags,
    {
      Name = "App Instance with Security Group"
      Demo = "replace_triggered_by"
    }
  )

  # Lifecycle Rule: Replace instance when security group changes
  # This ensures the instance is recreated with new security rules

  lifecycle {
    replace_triggered_by = [
        aws_security_group.app_sg.id
    ]
  }
}

