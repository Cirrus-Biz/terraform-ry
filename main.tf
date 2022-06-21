# VPC, Subnets (private, public), route tables, IGW Internet Gateway, NAT gateways, 
module "vpc" {
  source = "./networking"
}

# Security Groups
module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id.id
}

# IAM roles and policies

# RDS instances

# KMS keys

# S3 buckets
module "s3-bucket" {
  source = "./s3-bucket"

  bucket_name = "aline-s3-ry"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# Application Load Balancers 

### DONE ###