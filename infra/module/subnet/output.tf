output "subnet_ids" {
  description = "IDs of the created subnets"
  value = {for k, v in aws_subnet.subnets: k => v.id}
}

output "subnet_cidr_blocks" {
  description = "CIDR blocks of the created subnets"
  value = {for k, v in aws_subnet.subnets: k => v.cidr_block}
}

output "subnet_tags" {
  description = "Tags of the created subnets"
  value       = { for k, v in aws_subnet.main : k => v.tags }
}