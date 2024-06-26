
# Módulo EC2

## Descripción

Este código configura una infraestructura completa en AWS para una aplicación web escalable y balanceada automáticamente:

- Utiliza EC2 con autoscaling para manejar la carga de trabajo variable.
- Implementa un balanceador de carga ALB para distribuir el tráfico entrante entre las instancias EC2.
- Configura la integración con EFS para almacenamiento compartido y persistente.
- Asegura la aplicación mediante grupos de seguridad adecuadamente configurados.

## Componentes

- **Locals Block**: Define una variable, que contiene un script en formato bash. Este script se ejecutará en cada instancia EC2 creada por la plantilla de lanzamiento para configurar y desplegar la aplicación web.
- **Launch Template**: Define una plantilla de lanzamiento para las instancias EC2.
- **Auto Scaling Group**: Crea un grupo de autoescalado para manejar la capacidad de la aplicación web.
- **Application Load Balancer**: Crea un ALB para distribuir el tráfico a las instancias EC2.
- **Listeners and Target Groups**: Configura los listeners y grupos de destino para el ALB.

## Variables

- `alb_sg_id`: ID del Security Group del Load Balancer.
- `appweb_sg_id`: ID del Security Group de la aplicación web.
- `efs_id`: ID del sistema de archivos EFS.
- `db_endpoint`: Endpoint de la base de datos.
- `db_username`: Nombre de usuario de la base de datos.
- `db_password`: Contraseña de la base de datos.
- `db_name`: Nombre de la base de datos.
- `key_name`: Nombre de la clave de SSH.
- `id_vpc`: ID del VPC.
- `id_subnet_a`: ID de la Subnet A.
- `id_subnet_b`: ID de la Subnet B.
- `subnet_a_cidr`: CIDR de la Subnet A.
- `subnet_b_cidr`: CIDR de la Subnet B.
- `vpc_aws_az-a`: Zona de disponibilidad A.
- `vpc_aws_az-b`: Zona de disponibilidad B.

## Outputs

- `load_balancer_dns`: DNS del Load Balancer.

