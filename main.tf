# VPC, Subnets (private, public), route tables, IGW Internet Gateway, NAT gateways, 
module "vpc" {
  source = "./networking"
}

# Security Groups
module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id.id
}

# resource "aws_instance" "foo" {
#   ami           = "ami-0ff8a91507f77f867"
#   instance_type = "t1.2xlarge" # invalid type!
# }
# S3 buckets

# Application Load Balancers 

### DONE ###