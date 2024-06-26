# Migración de Infraestructura On-Premise a AWS

## Descripción del Obligatorio

Este proyecto tiene como objetivo migrar la infraestructura on-premise de una empresa de e-commerce a Amazon Web Services (AWS) para mejorar la escalabilidad y la performance del sitio web tras una campaña publicitaria que incrementó significativamente el tráfico. La solución propuesta implica el uso de Terraform para automatizar la creación y configuración de la infraestructura en AWS.

## Arquitectura Implementada

![Diagrama AWS](https://github.com/nicolasmm365/ObligatorioTF/blob/main/images/Diagrama%20AWS%20v2.jpg)

La nueva arquitectura en AWS incluye los siguientes componentes:

- Una Virtual Private Cloud (VPC) con dos subredes públicas y dos subredes privadas, en dos zonas de disponibilidad (us-east-1a y us-east-1b).
- Un Internet Gateway para proporcionar acceso a Internet.
- Grupos de seguridad (Security Groups) para controlar el tráfico de entrada y salida.
- Un Application Load Balancer (ALB) para distribuir el tráfico entre las instancias web.
- Dos instancias de aplicación EC2, cada una en una zona de disponibilidad diferente.
- Una base de datos relacional MySQL alojada en una instancia de RDS.
- Un sistema de archivos EFS para almacenamiento compartido y persistente.
- Una política de Backup que se utilizara para realizar los backups del EFS y el RDS.
- Un Autoscaling group que se encargada de levantar instancias en caso de que alguna falle.

## Contenido del Repositorio

El repositorio contiene los siguientes archivos y directorios:

- `main.tf`: Archivo principal de Terraform que define los recursos de AWS.
- `README.md`: Este archivo, que describe el proyecto y su implementación.
- `variables.tf`: Archivo que contiene las variables que seran utilizadas en el main.
- `valores.tfvars`: Archivo que contiene el valor de las variables.
- `outputs.tf`: Archivo que define las salidas de output.
- `/modules`: Carpeta donde se almacenan los distintos modulos.
- Diagrama de arquitectura: Un archivo en formato `draw.io` que muestra la arquitectura completa de la solución.
- Documentación adicional: Información detallada sobre la configuración de la infraestructura, tipos de instancias, bloques CIDR, etc.

## Requisitos Previos

Para implementar esta solución, necesitarás:

- Una cuenta de AWS con permisos suficientes para crear los recursos mencionados.
- Terraform instalado en tu máquina local.
- Una clave SSH válida para acceder a las instancias EC2.
- Acceso a internet para clonar el repositorio de GitHub y descargar dependencias.

## Instrucciones de Implementación

1. **Clonar el Repositorio y posicionarse en el directorio**:
    ```bash
    git clone https://github.com/nicolasmm365/ObligatorioTF.git
    cd ObligatorioTF
    ```

2. **Inicializar Terraform**:
    ```bash
    terraform init
    ```

3. **Revisar el Plan**:
    ```bash
    terraform plan
    ```

4. **Aplicar la Configuración**:
    ```bash
    terraform apply
    ```
    - Ingresa `yes` cuando se te solicite para confirmar la aplicación de los cambios.

## Descripción Detallada de la Infraestructura

### VPC y Subredes
- **VPC**: Una VPC con un CIDR block de `10.0.0.0/16`.
- **Subredes**: Dos subredes públicas (para los servidores web) y dos subredes privadas (para las bases de datos), en las zonas de disponibilidad `us-east-1a` y `us-east-1b`.

### Grupos de Seguridad
- **Load Balancer Security Group**: Permite el tráfico HTTP entrante (puerto 80) desde cualquier IP para que los clientes puedan acceder a la pagina web del ecommerce.
- **App Web Security Group**: Permite el tráfico HTTP desde el Load Balancer y el tráfico SSH (puerto 22) solamente de las direcciones IP publicas de los admin.
- **MySQL Security Group**: Permite el tráfico MySQL (puerto 3306) desde el grupo de seguridad de la aplicación web.
- **EFS Security Group**: Permite el tráfico NFS (puerto 2049) desde el grupo de seguridad de la aplicación web.

### Load Balancer y Target Groups
- **Application Load Balancer**: Distribuye el tráfico HTTP entre las instancias de aplicación.
- **Target Groups**: Grupos de destino para las instancias de aplicación, con chequeos de salud configurados.

### Instancias de Aplicación
- **EC2 Instances**: Dos instancias `t2.micro` con Amazon Linux 2, cada una en una subred diferente. Configuradas para servir una aplicación PHP clonada desde un repositorio de GitHub, que luego se modificara y almacenara en el EFS montado en ambas instancias.
- **Auto Scalling Group**: Se encargará de que en caso de falla de alguna de las instancias, estas se vuelvan a crear respetando los parametros preestablecidos en el Launch Template.


#### Repositorio de la Aplicación Web
https://github.com/adandrea8/php-ecommerce


### Base de Datos
- **RDS MySQL Instance**: Una instancia `db.t3.micro` de MySQL con 20GB de almacenamiento, configurada con Multi-AZ en subredes privadas.

### Almacenamiento de Archivos
- **EFS**: Sistema de archivos EFS con puntos de montaje en ambas subredes publicas y políticas de backup habilitadas.

## Módulos ##
En los siguientes links se podrá acceder a los distintos README en los cuales se encontrará una breve descripción del funcionamiento del código desplegado en cada módulo.


|  Modulo  |  Descripción |
|--|--|
|  [EC2](https://github.com/nicolasmm365/ObligatorioTF/blob/main/modules/ec2)  |  Despliegue de instancias EC2, load balancer, auto scalling group, etc. |
|  [EFS](https://github.com/nicolasmm365/ObligatorioTF/blob/main/modules/efs)  | Despliegue del file system y la creación del backup vault.   |
|[RDS](https://github.com/nicolasmm365/ObligatorioTF/blob/main/modules/rds) | Despliegue de la instancia de base de datos RDS con motor MySQL.|
| [SG](https://github.com/nicolasmm365/ObligatorioTF/blob/main/modules/sg) | Despliegue de los Security Groups necesarios para la comunicación entre los recursos.|
|  [VPC](https://github.com/nicolasmm365/ObligatorioTF/blob/main/modules/vpc) | Despliegue de todo lo relacionado con la red.

En este caso todos los módulos dependen implícitamente uno de otro, con excepción del VPC, que será el primer módulo en ser creado.
Por lo cual se podría utilizarlo con otros fines sin depender de los otros. Como por ejemplo crear varias instancias y distribuirlas entre las 4 subnets que crea este módulo. Siempre teniendo en cuenta que las variables que se vayan a utilizar en el main.tf, deben ser invocadas con el código `module.<nombre del módulo>.<nombre de la variable exportada>` si son exportadas de otro módulo, de lo contrario, deben estar definidas en variables.tf y declaradas en terraform.tfvars. Como se muestra en el siguiente [ejemplo](https://github.com/nicolasmm365/ObligatorioTF/blob/main/ejemplo).

## Colaboración y Buenas Prácticas

El trabajo en el repositorio ha seguido buenas prácticas de desarrollo colaborativo:

- **Branches**: Se ha utilizado una rama principal (`main`) y dos ramas de pruebas (`pruebas` y `pruebas-2`) para el desarrollo.
- **Pull Requests**: Se han realizado pull requests para la revisión de código antes de fusionar cambios.
- **Comentarios**: Se han agregado comentarios en el código y en los commit para facilitar su comprensión.

## Diagramas y Documentación

El repositorio incluye un diagrama de arquitectura detallado en formato `draw.io`, mostrando todos los componentes de la infraestructura y sus interconexiones.

## Aplicación WEB ##
![imagen](https://github.com/nicolasmm365/ObligatorioTF/blob/main/images/Aplicacion-Web.jpg)

Al finalizar el despliegue de la infraestructura en terraform, devolvera el link de la aplicación web (load balancer).

## Demostración 

[Video del funcionamiento](https://www.youtube.com/watch?v=QgYhiBQeNH0)

[Presentación](https://1drv.ms/p/c/5db136d40da74e35/ESOwjZYHb49Ji1vbGTQiO0YBVFSzf4o6GHjKq8YP6RbcJg?e=Hdbb7g)


## Conclusión

Este proyecto demuestra cómo migrar una infraestructura on-premise a AWS utilizando Terraform para automatizar el proceso. La solución mejora la escalabilidad y resiliencia del sitio web de e-commerce, asegurando una mejor experiencia para los usuarios.

Para más información, consulta la documentación incluida en el repositorio.

## Recursos

[Terraform - AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)


## Alumnos

Nicolas Martins - 292534

Alexis D'Andrea - 230556

---

© 2024 Nicolas Martins - Alexis D'Andrea
