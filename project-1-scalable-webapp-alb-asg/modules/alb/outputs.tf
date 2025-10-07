output "alb_dns" {
  value = aws_lb.web.dns_name
}

output "tg_arn" {
  value = aws_lb_target_group.web.arn
}