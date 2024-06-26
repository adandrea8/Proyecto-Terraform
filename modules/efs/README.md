
# Módulo EFS (Elastic File System)

## Descripción

Este código define un sistema de archivos EFS en AWS con puntos de montaje en dos subredes, establece un almacén de respaldo y un plan de respaldo programado semanalmente. 

Además, configura selecciones de respaldo para el sistema de archivos EFS y una instancia de base de datos, asegurando que los datos críticos estén protegidos mediante respaldos automatizados según la programación especificada.


## Componentes

- **EFS File System**: Crea un sistema de archivos EFS.
- **EFS Mount Targets**: Crea puntos de montaje en las subnets especificadas.
- **Backup Vault**: Crea el backup voult, donde se almacenaran los backups.
- **Backup Plan**: Crea el plan de backup en el cual se decide cuando se haran y cuanto tiempo persistiran los mismos.
- **Backup Selection**: Selecciona los recursos a respaldar.

## Variables

- `id_subnet_a`: ID de la Subnet A.
- `id_subnet_b`: ID de la Subnet B.
- `efs_sg_id`: ID del Security Group para EFS.
- `db_instance_arn`: ARN de la instancia de la base de datos (para propósitos de autorización).

## Outputs

- `efs_id`: ID del sistema de archivos EFS.

