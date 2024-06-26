# EFS
variable "efs_id" {
  description = "ID del EFS"
}

# RDS
variable "db_endpoint" {
  description = "Endpoint de la instancia RDS"
}

variable "rds_db_username" {
  description = "Usuario de la instancia RDS"
  type        = string
}

variable "rds_db_password" {
  description = "Password de la instancia RDS"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nombre de base de datos"
}

# EC2
variable "key_name" {
  description = "Par de claves vockey"
  type        = string
}

# VPC
variable "vpc_aws_az-a" {
  description = "Zona de Disponibilidad a"
}

variable "vpc_aws_az-b" {
  description = "Zona de Disponibilidad b"
}

variable "id_vpc" {
  type = string
  description = "Para saber el Output ID de la VPC"
}

variable "id_subnet_a" {
  type = string
  description = "ID del Subnet a"
}

variable "id_subnet_b" {
  type = string
  description = "ID del Subnet b"
}

variable "subnet_a_cidr" {
  description = "Direccion de primer subred"
}

variable "subnet_b_cidr" {
  description = "Direccion segunda subred"
}

# Security Group
variable "alb_sg_id" {
  type        = string
  description = "ID del Security group del ALB"
}

variable "appweb_sg_id" {
  type        = string
  description = "ID del Security group del web Server"
}
