output "vpc_id" {
  value = aws_vpc.main.id
}

output "external_alb_dns_name" {
  value = aws_lb.external.dns_name
}

output "internal_alb_dns_name" {
  value = aws_lb.internal.dns_name
}

output "web_target_group_arn" {
  value = aws_lb_target_group.web.arn
}

output "app_target_group_arn" {
  value = aws_lb_target_group.app.arn
}

output "web_asg_name" {
  value = aws_autoscaling_group.web.name
}

output "app_asg_name" {
  value = aws_autoscaling_group.app.name
}

output "aurora_writer_endpoint" {
  value = aws_rds_cluster.aurora.endpoint
}

output "aurora_reader_endpoint" {
  value = aws_rds_cluster.aurora.reader_endpoint
}

