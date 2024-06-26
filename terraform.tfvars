# Provider
region        = "us-east-1"

# VPC
vpc_cidr      = "10.0.0.0/16"
subnet_a_cidr   = "10.0.1.0/24"
subnet_b_cidr   = "10.0.2.0/24"
vpc_aws_az-a    = "us-east-1a"
vpc_aws_az-b    = "us-east-1b"
vpc_name        = "vpc-obligatorio"
tag_subnet_a    = "Subnet A"
tag_subnet_b    = "Subnet B"
tag_igw         = "obligatorio-igw"
tag_rtable      = "route_table_obligatorio"

# EC2
key_name      = "vockey"

# Security Group
nombre_sg_lb      = "tf_sg_lb_obligatorio"
tag_sg_lb         = "tf_sg_lb_obligatorio"
nombre_sg_appweb  = "tf_sg_appweb_obligatorio"
tag_sg_appweb     = "tf_sg_appweb_obligatorio"
nombre_sg_mysql   = "tf_sg_mysql_obligatorio"
tag_sg_mysql      = "tf_sg_mysql_obligatorio"
nombre_sg_efs     = "tf_sg_efs_obligatorio"
tag_sg_efs        = "tf_sg_efs_obligatorio"

# RDS
rds_db_username       = "admin"
rds_db_password       = "password"
rds_instance_class    = "db.t3.micro"
rds_tag_name_db       = "obligatorio-db"
db_name               = "iDukan"
rds_engine_version    = "5.7.44"
rds_engine            = "mysql"
rds_storage_type      = "gp2"
rds_allocated_storage = 20
