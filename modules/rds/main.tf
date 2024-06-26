resource "aws_db_subnet_group" "obligatorio_db_subnet_group" {
  name       = "obligatorio-db-subnet-group"
  subnet_ids = [var.id_subnet_a_private,var.id_subnet_b_private]
  tags = {
    Name = "obligatorio-db-subnet-group"
  }
}

resource "aws_db_instance" "obligatorio-db" {
#  multi_az            = true                           # Se deja comentado, ya que no se cuenta con permisos suficientes
  allocated_storage    = var.rds_allocated_storage
  storage_type         = var.rds_storage_type
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  username             = var.rds_db_username
  password             = var.rds_db_password
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name = aws_db_subnet_group.obligatorio_db_subnet_group.name
  db_name              = var.db_name
  tags = {
    Name = var.rds_tag_name_db
  }
}
