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
  access_key = "AKIA22ZYTAKVMZGQMNNS"
  secret_key = "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"
  profile = "default"
  region  = "us-east-1"
}