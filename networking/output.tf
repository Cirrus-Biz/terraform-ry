output "subnet_id_public" {
  value = aws_subnet.aline-public.id
}

output "subnet_id_private" {
  value = aws_subnet.aline-private.id
}

output "subnet_id_vpc" {
  value = aws_vpc.mainvpc.id
}

output "vpc_id" {
  value = aws_vpc.mainvpc
}