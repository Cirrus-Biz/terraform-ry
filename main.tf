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

  tags = {
    Name = "aline-ec2-instance"
  }
}

# VPC
# # EC2 instances
# module "ec2" {
#   source = "./modules/ec2"

#   instance_name = "aline-ec2-instance"

#   ami                    = "ami-0022f774911c1d690"
#   instance_type          = "t2.micro"
#   key_name               = "JR.Yabut"
#   monitoring             = true
#   vpc_security_group_ids = ["sg-12345678"]
#   subnet_id              = 

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }


# VPC
# Subnets (private, public)
module "vpc" {
  source = "./modules/vpc"
}



# Security Groups

# IGW Internet Gateway

# NAT gateways

# route tables

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

# etc
