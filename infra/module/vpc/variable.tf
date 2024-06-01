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