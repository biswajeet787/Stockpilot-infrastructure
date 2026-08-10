output "alb_security_group_id" {
  description = "Security Group ID for the Application Load Balancer"
  value       = aws_security_group.alb_sg.id
}

output "ecs_security_group_id" {
  description = "Security Group ID for ECS Service"
  value       = aws_security_group.ecs_sg.id
}

output "rds_security_group_id" {
  description = "Security Group ID for RDS"
  value       = aws_security_group.rds_sg.id
}


output "jenkins_security_group_id" {
  description = "Security Group ID for Jenkins Server"
  value       = aws_security_group.jenkins_sg.id
}
