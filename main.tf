# Create any base/shared infrastructure resources using Terraform:
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# EC2 instances
resource "aws_instance" "app_server" {
  ami           = "ami-0022f774911c1d690"
  instance_type = var.aws_instance_type
  security_groups = [ "${module.vpc.security_group_private}" ]
  subnet_id = module.vpc.subnet_id_private

  tags = {
    Name = "aline-ec2-RY"
  }
}


# VPC, Subnets (private, public), route tables, IGW Internet Gateway, NAT gateways
module "vpc" {
  source = "./modules/vpc"
}

# Security Groups

# IAM roles and policies

# RDS instances

# KMS keys

# S3 buckets
module "s3-bucket" {
  source = "./modules/s3-bucket"

  bucket_name = "aline-s3-ry"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# Application Load Balancers 

### DONE ###








# EC2 instances
# module "ec2" {
#   source = "./modules/ec2"

#   instance_name = "aline-public-instance-RY"

#   ami                    = "ami-0022f774911c1d690"
#   instance_type          = "t2.micro"
#   key_name               = "JR.Yabut"
#   monitoring             = true
#   vpc_security_group_ids = [module.security_group_public]
#   subnet_id              = module.subnet_id_public

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }