# Private Security Group
resource "aws_security_group" "private" {
  name        = "aline-private-sg-RY"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "aline-private-sg-RY"
  }
}

resource "aws_security_group_rule" "private_out" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "private_in" {
  type = "ingress"
  from_port = 0
  to_port = 65535
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.private.id
}
