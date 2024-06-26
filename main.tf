provider "aws" {
  region                = var.region                       # Región de AWS
}

module "vpc" {
  source                = "./modules/vpc"

  vpc_cidr              = var.vpc_cidr                     # Direccion de Red
  subnet_a_cidr         = var.subnet_a_cidr                # Subnet A
  subnet_b_cidr         = var.subnet_b_cidr                # Subnet B
  vpc_aws_az-a          = var.vpc_aws_az-a                 # Zona de disponibilidad A
  vpc_aws_az-b          = var.vpc_aws_az-b                 # Zona de disponibilidad B
  vpc_name              = var.vpc_name                     # Nombre del VPC
  tag_subnet_a          = var.tag_subnet_a                 # Tag de la Subnet A
  tag_subnet_b          = var.tag_subnet_b                 # Tag de la Subnet B
  tag_igw               = var.tag_igw                      # Tag del Internet Gateway (IGW)
  tag_rtable            = var.tag_rtable                   # Tag de la Route Table
}

module "sg" {
  source = "./modules/sg"

  nombre_sg_lb          = var.nombre_sg_lb                # Nombre del Security Group del Load Balancer
  tag_sg_lb             = var.tag_sg_lb                   # Tag del Security Group del Load Balancer
  nombre_sg_appweb      = var.nombre_sg_appweb            # Nombre del Security Group de la aplicación web
  tag_sg_appweb         = var.tag_sg_appweb               # Tag del Security Group de la aplicación web
  nombre_sg_mysql       = var.nombre_sg_mysql             # Nombre del Security Group de MySQL
  tag_sg_mysql          = var.tag_sg_mysql                # Tag del Security Group de MySQL
  nombre_sg_efs         = var.nombre_sg_efs               # Nombre del Security Group de EFS
  tag_sg_efs            = var.tag_sg_efs                  # Tag del Security Group de EFS
  id_vpc                = module.vpc.id_vpc               # ID del VPC
}

module "rds" {
  source                = "./modules/rds"

  id_subnet_a_private   = module.vpc.id_subnet_a_private  # ID de la Subnet A
  id_subnet_b_private   = module.vpc.id_subnet_b_private  # ID de la Subnet B
  db_sg_id              = module.sg.db_sg_id              # ID del SG de la base de datos
  rds_db_username       = var.rds_db_username             # Nombre de usuario de la base de datos RDS
  rds_db_password       = var.rds_db_password             # Contraseña de la base de datos RDS
  db_name               = var.db_name                     # Nombre de  la base de datos RDS
  rds_instance_class    = var.rds_instance_class          # Clase de instancia de RDS
  rds_tag_name_db       = var.rds_tag_name_db             # Tag de la base de datos RDS
  rds_engine_version    = var.rds_engine_version          # Versión del motor de RDS
  rds_engine            = var.rds_engine                  # Motor de RDS
  rds_storage_type      = var.rds_storage_type            # Tipo de almacenamiento de RDS
  rds_allocated_storage = var.rds_allocated_storage       # Almacenamiento asignado a RDS
}

module "efs" {
  source                = "./modules/efs"

  id_subnet_a           = module.vpc.id_subnet_a          # ID de la Subnet A
  id_subnet_b           = module.vpc.id_subnet_b          # ID de la Subnet B
  efs_sg_id             = module.sg.efs_sg_id             # ID del SG de EFS
  db_instance_arn       = module.rds.db_instance_arn      # ARN de la instancia de la base de datos
}

module "ec2" {
  source                = "./modules/ec2"

  alb_sg_id             = module.sg.alb_sg_id             # ID del SG del Load Balancer
  appweb_sg_id          = module.sg.appweb_sg_id          # ID del SG de la aplicación web
  efs_id                = module.efs.efs_id               # ID de EFS
  db_endpoint           = module.rds.rds_db_endpoint      # Endpoint de la base de datos RDS
  rds_db_username       = var.rds_db_username             # Nombre de usuario de la base de datos
  rds_db_password       = var.rds_db_password             # Contraseña de la base de datos
  db_name               = module.rds.db_name              # Nombre de la base de datos
  key_name              = var.key_name                    # Nombre de la clave de SSH
  id_vpc                = module.vpc.id_vpc               # ID del VPC
  id_subnet_a           = module.vpc.id_subnet_a          # ID de la Subnet A
  id_subnet_b           = module.vpc.id_subnet_b          # ID de la Subnet B
  subnet_a_cidr         = module.vpc.subnet_a_cidr        # CIDR de la Subnet A
  subnet_b_cidr         = module.vpc.subnet_b_cidr        # CIDR de la Subnet B
  vpc_aws_az-a          = var.vpc_aws_az-a                # Zona de disponibilidad A
  vpc_aws_az-b          = var.vpc_aws_az-b                # Zona de disponibilidad B
}
