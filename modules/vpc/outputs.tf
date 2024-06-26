output "id_vpc" {
  description = "ID del VPC"
  value = aws_vpc.vpc_obligatorio.id
}

output "id_subnet_a" {
  description = "ID de la Subnet A"
  value = aws_subnet.subnet_a.id
}

output "id_subnet_b" {
  description = "ID de la Subnet B"
  value = aws_subnet.subnet_b.id
}

output "id_subnet_a_private" {
  description = "ID de la Subnet A Privada"
  value = aws_subnet.subnet_a_private.id
}

output "id_subnet_b_private" {
  description = "ID de la Subnet B Privada"
  value = aws_subnet.subnet_b_private.id
}

output "subnet_a_cidr" {
  description = "CIDR de la Subnet A"
  value = aws_subnet.subnet_a.cidr_block
}

output "subnet_b_cidr" {
  description = "CIDR de la Subnet B"
  value = aws_subnet.subnet_b.cidr_block
}

