output "alb_sg_id" {
  value = aws_security_group.tf_sg_lb_obligatorio.id
  description = "ID del security group del ALB"
}

output "appweb_sg_id" {
  value = aws_security_group.tf_sg_appweb_obligatorio.id
  description = "ID del security group del web Server"
}

output "db_sg_id" {
  value = aws_security_group.tf_sg_mysql_obligatorio.id
  description = "ID del security group del RDS"
}

output "efs_sg_id" {
  value = aws_security_group.tf_sg_efs_obligatorio.id
  description = "ID del security group del EFS"
}
