
# Módulo SG (Security Groups)

## Descripción

Este código crea varios grupos de seguridad en AWS para diferentes componentes de la infraestructura:

- Uno para un balanceador de carga (tf_sg_lb_obligatorio), al cual todos podrán acceder (incluso desde afera de la red.
- Uno para las aplicaciones web (tf_sg_appweb_obligatorio), que permite SSH desde cualquier dirección (en produccion se pondrían solo las IPs de los admin) y tráfico HTTP solamente desde el balanceador de carga.
- Uno para una base de datos MySQL (tf_sg_mysql_obligatorio), que permite acceso desde las aplicaciones web.
- Uno para EFS (tf_sg_efs_obligatorio), que permite acceso NFS desde las aplicaciones web.

Estos grupos de seguridad ayudan a controlar el tráfico dentro de la VPC y entre los diferentes componentes de la infraestructura, siguiendo las prácticas recomendadas de seguridad de AWS.

## Componentes

- **Security Group del Load Balancer**: Permite tráfico HTTP desde cualquier IP.
- **Security Group de la Aplicación Web**: Permite tráfico HTTP desde el SG del Load Balancer y tráfico SSH desde cualquier IP.
- **Security Group de MySQL**: Permite tráfico MySQL desde el SG de la Aplicación Web.
- **Security Group de EFS**: Permite tráfico NFS desde el SG de la Aplicación Web.

## Variables

- `nombre_sg_lb`: Nombre del Security Group del Load Balancer.
- `tag_sg_lb`: Tag del Security Group del Load Balancer.
- `nombre_sg_appweb`: Nombre del Security Group de la Aplicación Web.
- `tag_sg_appweb`: Tag del Security Group de la Aplicación Web.
- `nombre_sg_mysql`: Nombre del Security Group de MySQL.
- `tag_sg_mysql`: Tag del Security Group de MySQL.
- `nombre_sg_efs`: Nombre del Security Group de EFS.
- `tag_sg_efs`: Tag del Security Group de EFS.
- `id_vpc`: ID de la VPC.

## Outputs

- `alb_sg_id`: ID del Security Group del Load Balancer.
- `appweb_sg_id`: ID del Security Group de la Aplicación Web.
- `db_sg_id`: ID del Security Group de MySQL.
- `efs_sg_id`: ID del Security Group de EFS.

