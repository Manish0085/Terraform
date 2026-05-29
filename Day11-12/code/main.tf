
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
  all_locations = concat(var.default_locations, var.user_locations)
  unique_locations = toset(local.all_locations)
  positive_cost = [
    for cost in var.monthly_costs:
      abs(cost)
    
  ]

  list_cost = [
    for cost in local.positive_cost: 
      tonumber(cost)
  ]

  max_cost = max(local.positive_cost...)
  min_cost = min(local.positive_cost...)
  total_cost = sum(local.positive_cost)
  avg_cost = local.total_cost/length(local.positive_cost)

  current_timestamp = timestamp()
  fomat_date1 = formatdate("yyyyMMdd", timestamp())
  fomat_date2 = formatdate("yyyy-MM-dd", local.current_timestamp)  
  timestamp_name = "backup-${local. fomat_date2}"
}


resource "aws_s3_bucket" "first-s3"{
  bucket = local.formatted_bucket_name

  tags = local.new_tag
  

}






















