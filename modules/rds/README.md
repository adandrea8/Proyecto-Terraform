

# Módulo RDS (Relational Database Service)

## Descripción

En conjunto, estos recursos permiten la creación de una instancia de base de datos en AWS, alojada en las subredes especificadas y configurada con los parámetros de almacenamiento, motor, tipo de instancia, credenciales de acceso y grupos de seguridad necesarios. Esto asegura que la instancia de base de datos esté correctamente configurada y accesible dentro de la infraestructura definida en Terraform.

## Componentes

- **DB Subnet Group**: Define un grupo de subnets para la instancia de RDS.
- **RDS Instance**: Crea una instancia de base de datos MySQL.

## Variables

- `db_sg_id`: ID del Security Group para la base de datos.
- `rds_db_username`: Nombre de usuario para la base de datos.
- `rds_db_password`: Contraseña para la base de datos.
- `id_subnet_a_private`: ID de la Subnet A Privada.
- `id_subnet_b_private`: ID de la Subnet B Privada.
- `rds_instance_class`: Clase de instancia para RDS.
- `rds_tag_name_db`: Tag para la base de datos.
- `rds_db_name`: Nombre de la base de datos.
- `rds_engine_version`: Versión del motor de RDS.
- `rds_engine`: Motor de la base de datos (e.g., MySQL).
- `rds_storage_type`: Tipo de almacenamiento para RDS.
- `rds_allocated_storage`: Almacenamiento asignado a RDS.

## Outputs

- `rds_db_instance_arn`: ARN de la instancia de RDS.
- `rds_db_endpoint`: Endpoint de la base de datos.
- `rds_db_name`: Nombre de la base de datos.
- `db_subnet_group_name`: Subnet group de la base de datos.
