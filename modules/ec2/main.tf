

locals {
  webapp_user_data = <<-EOF
    #!/bin/bash
    sudo amazon-linux-extras enable epel
    sudo yum -y install epel-release
    sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo yum-config-manager --enable remi-php54
    sudo yum -y install php php-cli php-common php-mbstring php-xml php-mysql php-fpm
    sudo yum -y install httpd git
    sudo systemctl enable httpd
    sudo systemctl start httpd
    sudo yum install -y amazon-efs-utils
    sudo mount -t efs -o tls ${var.efs_id}:/ /var/www/html
    git clone https://github.com/adandrea8/php-ecommerce   
    sudo cp -r php-ecommerce/* /var/www/html/
    sudo sed -i s/db_endpoint/$(echo ${var.db_endpoint} | cut -d: -f1)/g /var/www/html/config.php 
    sudo yum -y install php-mysql.x86_64
    sudo yum -y install mariadb.x86_64
    mysql -h $(echo ${var.db_endpoint} | cut -d: -f1) -u ${var.rds_db_username} -p${var.rds_db_password} ${var.db_name} < /var/www/html/dump.sql
    sudo systemctl restart httpd
  EOF
}

resource "aws_launch_template" "webapp_launch_template" {
  name_prefix   = "webapp_launch_template"
  image_id      = "ami-02aead0a55359d6ec"
  instance_type = "t2.micro"
  key_name      = var.key_name
  ebs_optimized = false


  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.id_subnet_a
    security_groups             = [var.appweb_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name      = "webapp"
      terraform = "True"
    }
  }

  user_data = base64encode(local.webapp_user_data)
}

resource "aws_autoscaling_group" "webapp_autoscaling_group" {
  name      = "webapp-autoscaling-group"
  launch_template {
    id      = aws_launch_template.webapp_launch_template.id
    version = "$Latest"
  }

  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2

   vpc_zone_identifier       = [var.id_subnet_a, var.id_subnet_b]
  
  target_group_arns         = [aws_lb_target_group.obligatorio_target_group.arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300

  lifecycle {
    create_before_destroy   = true
  }
}

resource "aws_lb" "obligatorio_alb" {
  name               = "obligatorio-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = [var.id_subnet_a,var.id_subnet_b]

  tags = {
    Name = "obligatorio-alb"
    Environment = "production"
  }
}

resource "aws_lb_listener" "obligatorio_listener" {
  load_balancer_arn = aws_lb.obligatorio_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.obligatorio_target_group.arn
  }
}

resource "aws_lb_target_group" "obligatorio_target_group" {
  name        = "obligatorio-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.id_vpc
  target_type = "instance"

  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 60
  }

  tags = {
    Name = "obligatorio-target-group"
  }
}

resource "aws_lb_listener_rule" "obligatorio_listener-rule" {
  listener_arn = aws_lb_listener.obligatorio_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.obligatorio_target_group.arn
  }
  condition {
    path_pattern {
      values = ["/var/www/html/index.html"]
    }
  }
}
