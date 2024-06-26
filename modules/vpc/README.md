
# Módulo VPC

## Descripción

Este código crea una VPC con dos subredes públicas y dos subredes privadas, en diferentes zonas de disponibilidad de AWS, habilita la conectividad a internet a través de una puerta de enlace de internet, y configura una tabla de enrutamiento para dirigir el tráfico público hacia la puerta de enlace.

## Componentes

- **VPC**: Crea una VPC con soporte de DNS y nombres de host.
- **Subnets**: Crea dos subnets públicas y dos subnets privadas, en diferentes zonas de disponibilidad.
- **Internet Gateway**: Permite la conectividad de la VPC a Internet.
- **Route Table**: Configura una tabla de rutas para permitir el tráfico a través del Internet Gateway.
- **Route Table Association**: Asocia las subnets a la Route Table.

## Variables

- `vpc_cidr`: CIDR block para la VPC.
- `subnet_a_cidr`: CIDR block para la Subnet A.
- `subnet_b_cidr`: CIDR block para la Subnet B.
- `vpc_aws_az-a`: Zona de disponibilidad para la Subnet A.
- `vpc_aws_az-b`: Zona de disponibilidad para la Subnet B.
- `vpc_name`: Nombre de la VPC.
- `tag_subnet_a`: Tag para la Subnet A.
- `tag_subnet_b`: Tag para la Subnet B.
- `tag_igw`: Tag para el Internet Gateway.
- `tag_rtable`: Tag para la Route Table.

## Outputs

- `id_vpc`: ID de la VPC creada.
- `id_subnet_a`: ID de la Subnet A creada.
- `id_subnet_b`: ID de la Subnet B creada.
- `id_subnet_a_private`: ID de la Subnet A Privada creada.
- `id_subnet_b_private`: ID de la Subnet B Privada creada.
- `subnet_a_cidr`: CIDR de la Subnet A creada.
- `subnet_b_cidr`: CIDR de la Subnet B creada.

