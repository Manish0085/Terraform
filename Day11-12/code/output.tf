output "formatted_project_name" {
    value = local.formatted_project_name
}

output "port_list" {
    value = local.port_list
} 

output "sg_rules" {
    value = local.sg_rules
}

output "instance_size" {
    value = local.instance_size
}

output "credentails" {
    value = "xyz1234"
    sensitive = true
}

output "all_locations" {
    value = local.all_locations
}

output "unique_locations" {
    value = local.unique_locations
}


output "monthly_cost" {
    value = local.positive_cost
}

output "max_cost" {
    value = local.max_cost
}
output "min_cost" {
    value = local.min_cost
}
output "total_cost" {
    value = local.total_cost
}
output "avg_cost" {
    value = local.avg_cost
}

output "date" {
    value = local.current_timestamp
}

output "first_date_format" {
    value = local.fomat_date1
}


output "second_date_format" {
    value = local.fomat_date2
}
