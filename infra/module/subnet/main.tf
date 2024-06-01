resource "aws_subnet" "subnets" {
  for_each = var.subnet_config
        
  vpc_id                          = var.vpc_ids[each.value.vpc_key]
  cidr_block                      = each.value.cidr_block
  map_public_ip_on_launch         = each.value.map_public_ip_on_launch
  enable_dns64                    = each.value.enable_dns64
  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation
}

