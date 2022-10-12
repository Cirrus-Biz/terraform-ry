variable "vpc_name" {
  type = string
}

variable "cidr_ab" {
    type = map
    default = {
        development     = "172.22"
        qa              = "172.24"
        staging         = "172.26"
        production      = "172.28"
    }
}

locals {
    cidr_c_private_subnets  = 1
    cidr_c_load_balancer_subnets = 11
    cidr_c_public_subnets   = 64

    max_private_subnets     = 2
    max_load_balancer_subnets    = 0
    max_public_subnets      = 2
}

data "aws_availability_zones" "available" {
    state = "available"
}

locals {
    availability_zones = data.aws_availability_zones.available.names
}

variable "environment" {
    type = string
    description = "Options: development, qa, staging, production"
}

locals {
    private_subnets = [
        for az in local.availability_zones : 
            "${lookup(var.cidr_ab, var.environment)}.${local.cidr_c_private_subnets + index(local.availability_zones, az)}.0/24"
            if index(local.availability_zones, az) < local.max_private_subnets
        ]
    public_subnets = [
        for az in local.availability_zones : 
            "${lookup(var.cidr_ab, var.environment)}.${local.cidr_c_public_subnets + index(local.availability_zones, az)}.0/24"
            if index(local.availability_zones, az) < local.max_public_subnets
        ]
    
    load_balancer_subnets = [
        for az in local.availability_zones : 
            "${lookup(var.cidr_ab, var.environment)}.${local.cidr_c_load_balancer_subnets + index(local.availability_zones, az)}.0/24"
            
            if index(local.availability_zones, az) < local.max_load_balancer_subnets
        ]
}