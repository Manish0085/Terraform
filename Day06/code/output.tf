# Output variable

output "vpc_id" {
    value = aws_vpc.sample_vpc.id
}

output "ec2_id" {
    value = aws_instance.example.id
}
