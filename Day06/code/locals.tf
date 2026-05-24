locals {
    bucket_name = "${var.github_user}-bucket-${var.environment}-${var.region}"
    vpc_name = "${var.environment}-VPC"
}