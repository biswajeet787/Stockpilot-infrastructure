output "ecs_execution_role_arn" {
  description = "ARN of the ECS Execution Role"
  value       = aws_iam_role.ecs_execution_role.arn
}

output "ecs_execution_role_name" {
  description = "Name of the ECS Execution Role"
  value       = aws_iam_role.ecs_execution_role.name
}

output "ecs_task_role_arn" {
  description = "ARN of the ECS Task Role"
  value       = aws_iam_role.ecs_task_role.arn
}

output "ecs_task_role_name" {
  description = "Name of the ECS Task Role"
  value       = aws_iam_role.ecs_task_role.name
}

output "jenkins_instance_profile_name" {
  description = "Jenkins EC2 Instance Profile"

  value = aws_iam_instance_profile.jenkins_profile.name
}

output "jenkins_role_arn" {
  description = "Jenkins IAM Role ARN"

  value = aws_iam_role.jenkins_role.arn
}

output "lambda_role_arn" {

  description = "ARN of the Lambda IAM Role"

  value = aws_iam_role.lambda_role.arn

}
