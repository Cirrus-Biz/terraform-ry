# Private Subnet
resource "aws_subnet" "aline-private" {
  vpc_id = aws_vpc.mainvpc.id
  cidr_block = var.private_subnet

  tags = {
    Name = "private-subnet-RY"
  }
}

    # Route Table for Public Subnet's
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.mainvpc.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.aline_nat_gw.id
  }

  tags = {
      Name = "private-route-table-RY"
  }
}

    # Route table Association with Private Subnet's
 resource "aws_route_table_association" "aline_private_rt_association" {
    subnet_id = aws_subnet.aline-private.id
    route_table_id = aws_route_table.private_rt.id
 }