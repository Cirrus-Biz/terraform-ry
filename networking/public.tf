# Public Subnet
resource "aws_subnet" "aline-public" {
  vpc_id = aws_vpc.mainvpc.id
  cidr_block = var.public_subnet

  tags = {
    Name = "public-subnet-RY"
  }
}

    # Route Table for Public Subnet's
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.mainvpc.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.aline_nat_gw.id
  }

  tags = {
      Name = "public-route-table-RY"
  }
}

    # Route table Association with Public Subnet's
 resource "aws_route_table_association" "aline_public_rt_association" {
    subnet_id = aws_subnet.aline-public.id
    route_table_id = aws_route_table.public_rt.id
 }

 # Public subnet 2