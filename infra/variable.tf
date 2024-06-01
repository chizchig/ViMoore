variable "vpc_configs" {
  type = map(object({
    cidr_block       = string
    instance_tenancy = string
    tags             = map(string)
  }))
  default = {
    vpc1 = {
      cidr_block       = "10.0.0.0/16"
      instance_tenancy = "default"
      tags = {
        Name = "main-vpc1"
      }
    }
    vpc2 = {
      cidr_block       = "10.1.0.0/16"
      instance_tenancy = "default"
      tags = {
        Name = "main-vpc2"
      }
    }
  }
}

variable "subnet_config" {
  type = map(object({
    cidr_block                      = string
    name                            = string
    vpc_key                         = string
    enable_dns64                    = bool
    map_public_ip_on_launch         = bool
    assign_ipv6_address_on_creation = bool
  }))
  default = {
    public_subnet = {
      vpc_key                         = "vpc1"
      cidr_block                      = "10.0.1.0/24"
      enable_dns64                    = true
      map_public_ip_on_launch         = true
      assign_ipv6_address_on_creation = true
    }
    private_subnet = {
      vpc_key                         = "vpc2"
      cidr_block                      = "10.0.2.0/24"
      enable_dns64                    = true
      map_public_ip_on_launch         = false
      assign_ipv6_address_on_creation = true
    }
  }
}

variable "vpc_ids" {
  description = "ID of the VPC where the subnets will be created"
  type        = map(string)
}