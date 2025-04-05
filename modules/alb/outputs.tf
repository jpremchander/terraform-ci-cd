output "lb_dns_name" {
  value = aws_lb.application.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}

output "alb_dns_name" {
  value = aws_lb.application.dns_name
}

output "alb_arn" {
  value = aws_lb.application.arn
}
