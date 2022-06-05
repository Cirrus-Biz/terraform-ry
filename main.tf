# Create any base/shared infrastructure resources using Terraform:

# EC2 instances

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
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}


# VPC

# Subnets (private, public)

# Security Groups

# IGW

# NAT gateways

# route tables

# IAM roles and policies

# RDS instances

# KMS keys

# S3 buckets

# Application Load Balancers 

# etc
