resource "aws_instance" "example" {
  ami           = "ami-0ff8a91507f77f867"
  count = var.instance_count
  # instance_type = var.allowed_vm_types[3]
  instance_type = var.environment == "dev"? var.allowed_vm_types[0]: var.allowed_vm_types[2] 

  tags = var.tags
}


resource "aws_security_group" "ingress_rule" {
  name   = "sg"
  # vpc_id = aws_vpc.example.id

  dynamic "ingress"  {
        for_each = var.ingress_rules
        content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        cidr_blocks = ingress.value.cidr_blocks
        protocol = ingress.value.protocol
    }
  }
  egress  = []
}


locals {
    all_instance_ids = aws_instance.example[*].id
}


output "instances" {
    value = local.all_instance_ids
}