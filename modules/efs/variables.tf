# Security groups
variable "efs_sg_id" {
  description = "ID del Security Group del EFS"
}

# RDS
variable "db_instance_arn" {
  description = "The ARN of the RDS database instance to be backed up"
  type        = string
}

# VPC
variable "id_subnet_a" {
  description = "ID de la subnet a"
}

variable "id_subnet_b" {
  description = "ID de la subnet b"
}
