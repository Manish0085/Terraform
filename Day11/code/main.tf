
locals {
  formatted_project_name = lower(replace(var.project_name, " ", "-"))
  new_tag = merge(var.default_tags, var.production_tags)
  formatted_bucket_name = replace(
        replace(
          substr(lower(var.bucket_name), 0, 63),
          " ", "-"
      ),
      "!", ""
    )

  port_list = split(
      ", ", var.allowed_ports
    ) 

  sg_rules = [
    for port in local.port_list:
    {
      name = "port-${port}"
      port = port
      description = "Allow Traffic on port ${port}"
    }
  ]  

  instance_size = lookup(var.instance_sizes, var.environment, "t3.small")
}


resource "aws_s3_bucket" "first-s3"{
  bucket = local.formatted_bucket_name

  tags = local.new_tag
  

}






















