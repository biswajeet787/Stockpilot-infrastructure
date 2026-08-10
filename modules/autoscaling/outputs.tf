output "autoscaling_target_id" {
  description = "Application Auto Scaling Target ID"
  value       = aws_appautoscaling_target.ecs.id
}

output "autoscaling_policy_arn" {
  description = "Application Auto Scaling Policy ARN"
  value       = aws_appautoscaling_policy.cpu_target_tracking.arn
}