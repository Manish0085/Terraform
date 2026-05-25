variable tags {
    type = map(string)
    default = {
        Environment = "dev"
        Name = "dev-Instance"
        created_by = "terraform"
    }
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "bucket_names" {
    description = "This is the bucket list need to be created"
    type = list(string)
    default = ["manish0085-bucket-day08-1234561", "manish0085-bucket-day08-1234562"]
}

variable "bucket_name_set" {
    description = "This is the bucket set need to be created"
    type = set(string)
    default = ["manish0085-bucket-day08-1234560", "manish0085-bucket-day08-1234569"]
}