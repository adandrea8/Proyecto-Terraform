
resource "aws_security_group" "tf_sg_lb_obligatorio" {
  name = var.nombre_sg_lb
  vpc_id = var.id_vpc
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.tag_sg_lb
  }
}

resource "aws_security_group" "tf_sg_appweb_obligatorio" {
  name = var.nombre_sg_appweb
  vpc_id = var.id_vpc
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups  = [aws_security_group.tf_sg_lb_obligatorio.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.tag_sg_appweb
  }
}

resource "aws_security_group" "tf_sg_mysql_obligatorio" {
  name        = var.nombre_sg_mysql
  description = "Security group MySQL"
  vpc_id      = var.id_vpc

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups  = [aws_security_group.tf_sg_appweb_obligatorio.id]
  }
  tags = {
    Name = var.tag_sg_mysql
  }
}

resource "aws_security_group" "tf_sg_efs_obligatorio" {
  name        = var.nombre_sg_efs
  description = "Security group EFS"
  vpc_id      = var.id_vpc

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    security_groups  = [aws_security_group.tf_sg_appweb_obligatorio.id]
  }
}


