module "network" {
  source = "../module/vpc"

  for_each = var.vpc_configs

  name             = each.key
  cidr_block       = each.value.cidr_block
  instance_tenancy = each.value.instance_tenancy

}

module "subnets" {
  source = "../module/subnet"

  for_each = var.subnet_config

  name                            = each.key
  vpc_id                          = module.network[each.value.vpc_key].id
  cidr_block                      = each.value.cidr_block
  map_public_ip_on_launch         = each.value.map_public_ip_on_launch
  enable_dns64                    = each.value.enable_dns64
  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation

}