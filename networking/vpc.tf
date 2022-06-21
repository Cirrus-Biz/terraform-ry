# vpc
resource "aws_vpc" "mainvpc" {
  cidr_block = var.mainvpc

  tags = {
      Name = "aline-vpc-RY"
  }
}