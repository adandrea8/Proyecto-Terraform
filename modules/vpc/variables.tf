# VPC
variable "vpc_cidr" {
  description = "Direccion y mascara"
}

variable "subnet_a_cidr" {
  description = "Direccion de primer subred"
}

variable "subnet_b_cidr" {
  description = "Direccion segunda subred"
}

variable "vpc_aws_az-a" {
  description = "Zona de Disponibilidad a"
}

variable "vpc_aws_az-b" {
  description = "Zona de Disponibilidad b"
}

variable "vpc_name" {
  description = "Nombre del VPC"
}

variable "tag_subnet_a" {
  type = string
  description = "Tag Subnet a"
}

variable "tag_subnet_b" {
  type = string
  description = "Tag Subnet b"
}

variable "tag_igw" {
  type = string
  description = "Tag IGW"
}

variable "tag_rtable" {
  type = string
  description = "Tag Route Table"
}
