output "URL_WebApp" {
  description = "DNS del Load Balancer"
  value       = aws_lb.obligatorio_alb.dns_name
}
