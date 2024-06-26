output "db_instance_arn" {
  value = aws_db_instance.obligatorio-db.arn
  description = "ARN de base de datos"
}

output "rds_db_endpoint" {
  value = aws_db_instance.obligatorio-db.endpoint
  description = "Endpoint de base de datos"
}

output "db_name" {
  value = aws_db_instance.obligatorio-db.db_name
  description = "Nombre de base de datos"
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.obligatorio_db_subnet_group.name
  description = "Subnet group de base de datos"
}
