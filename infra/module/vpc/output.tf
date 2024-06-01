output "vpc_ids" {
  description = "IDS of createed VPCs"
  value = { for k, v in aws_vpc.vpc : k => v.id}
}

output "vpc_cidr_blocks" {
  description = "CIDR blocks of created VPCs"
  value = { for k, v in aws_vpc.vpc : k => v.cidr_block}
}