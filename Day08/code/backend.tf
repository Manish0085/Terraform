terraform {
  backend "s3" {
    bucket = "manish0085-terraform-st"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
