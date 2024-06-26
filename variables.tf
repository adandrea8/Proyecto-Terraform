# Provider
variable "region" {
  description = "Region"
  type        = string
}

variable "profile" {
  default     = "default"
  description = "Perfil estandar"
}

# EC2
variable "key_name" {
  description = "Par de claves vockey"
  type        = string
}

# VPC 
variable "vpc_cidr" {
  description = "CIDR del VPC"
}

variable "subnet_a_cidr" {
  description = "Direccion de subred a"
}

variable "subnet_b_cidr" {
  description = "Direccion de subred b"
}

variable "vpc_aws_az-a" {
  description = "Zona de disponibilidad a"
}

variable "vpc_aws_az-b" {
  description = "Zona de disponibilidad b"
}

variable "vpc_name" {
  description = "Nombre del VPC"
}

variable "tag_subnet_a" {
  type        = string
  description = "Tag Subnet a"
}

variable "tag_subnet_b" {
  type        = string
  description = "Tag Subnet b"
}

variable "tag_igw" {
  type        = string
  description = "Tag IGW"
}

variable "tag_rtable" {
  type        = string
  description = "Tag Route Table"
}

# Security Group 
variable "nombre_sg_lb" {
  type        = string
  description = "Nombre del SG para el LB"
}

variable "tag_sg_lb" {
  type        = string
  description = "Nombre del SG del LB"
}

variable "nombre_sg_appweb" {
  type        = string
  description = "Nombre del SG para del web Server"
}

variable "tag_sg_appweb" {
  type        = string
  description = "Nombre del SG del web Server"
}

variable "nombre_sg_mysql" {
  type        = string
  description = "Nombre del SG para MySql"
}
variable "tag_sg_mysql" {
  type        = string
  description = "Tag del SG de MySql"
}

variable "nombre_sg_efs" {
  type        = string
  description = "Nombre del SG para el EFS"
}
variable "tag_sg_efs" {
  type        = string
  description = "Tag del SG del EFS"
}

# RDS
variable "rds_instance_class" {
  description = "Tipo de instancia"
}

variable "rds_tag_name_db" {
  description = "Tag de base de datos"
}

variable "db_name" {
  description = "Nombre de base de datos"
}

variable "rds_engine_version" {
  description = "Version de motor de base de datos"
}

variable "rds_engine" {
  description = "Motor de base de datos"
}

variable "rds_storage_type" {
  description = "Tipo de storate"
}

variable "rds_allocated_storage" {
  description = "Localidad del storage"
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
