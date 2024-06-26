resource "aws_vpc" "vpc_obligatorio" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.vpc_obligatorio.id
  cidr_block        = var.subnet_a_cidr
  availability_zone = var.vpc_aws_az-a
  map_public_ip_on_launch = true
  tags = {
    Name = var.tag_subnet_a
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.vpc_obligatorio.id
  cidr_block        = var.subnet_b_cidr
  availability_zone = var.vpc_aws_az-b
  map_public_ip_on_launch = true
  tags = {
    Name = var.tag_subnet_b
  }
}

resource "aws_subnet" "subnet_a_private" {
  vpc_id            = aws_vpc.vpc_obligatorio.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.vpc_aws_az-a
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet A Privada"
  }
}

resource "aws_subnet" "subnet_b_private" {
  vpc_id            = aws_vpc.vpc_obligatorio.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = var.vpc_aws_az-b
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet B Privada"
  }
}

resource "aws_internet_gateway" "obligatorio_igw" {
  vpc_id = aws_vpc.vpc_obligatorio.id

  tags = {
    Name = var.tag_igw
  }
}

resource "aws_route_table" "route_table_obligatorio" {
  vpc_id = aws_vpc.vpc_obligatorio.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.obligatorio_igw.id
  }
  tags = {
    Name = var.tag_rtable
  }
}

resource "aws_route_table_association" "subnet_a_assoc" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.route_table_obligatorio.id
}

resource "aws_route_table_association" "subnet_b_assoc" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.route_table_obligatorio.id
}
