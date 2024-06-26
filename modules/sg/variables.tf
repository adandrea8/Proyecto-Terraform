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

# VPC
variable "id_vpc" {
  type        = string
  description = "ID de la VPC"
}
