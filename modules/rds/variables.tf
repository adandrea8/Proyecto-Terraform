# Security Group
variable "db_sg_id" {
  description = "ID del Security Group de base de datos"
}

# VPC
variable "id_subnet_a_private" {
  description = "ID del Security Group de subnet a privada"
}

variable "id_subnet_b_private" {
  description = "ID del Security Group de subnet b privada"
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
