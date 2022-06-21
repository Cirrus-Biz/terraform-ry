# Internet Gateway and attaches it to VPC
resource "aws_internet_gateway" "aline_igw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
      Name = "aline-igw-RY"
  }
}

# NAT Gateway using subnet_id and allocation_id
resource "aws_eip" "aline_nate_ip" {
  vpc = true
}

resource "aws_nat_gateway" "aline_nat_gw" {
  allocation_id = aws_eip.aline_nate_ip.id
  subnet_id = aws_subnet.aline-public.id
  
  tags = {
      Name = "aline-nat-gw-RY"
  }
}
