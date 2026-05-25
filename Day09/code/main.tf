resource "aws_instance" "example" {
    ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
    instance_type = var.allowed_vm_types[3]
    region = var.region

    tags = var.tags

    lifecycle {
        create_before_destroy = false
    }
}