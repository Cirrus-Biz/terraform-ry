module "vpc" {
   source = "terraform-aws-modules/vpc/aws"
    version = "~>2.0"
    name                 = var.vpc_name
    cidr                 = "${lookup(var.cidr_ab, var.environment)}.0.0/16"
    private_subnets      = local.private_subnets
    public_subnets       = local.public_subnets

    azs                  = local.availability_zones
}

# module "load_balancer" {
#   source = "./modules"
#   lb_name = "ry-lb"
#   load_balancer_type = "network"
#   subnets            = module.vpc.public_subnets

#   depends_on = [
#     module.vpc
#   ]
# }