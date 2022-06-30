# VPC, Subnets (private, public), route tables, IGW Internet Gateway, NAT gateways, 
module "vpc" {
  source = "./networking"
}

# Security Groups
module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id.id
}

# S3 buckets

# Application Load Balancers 

### DONE ###