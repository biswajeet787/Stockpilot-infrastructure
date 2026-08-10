variable "name_prefix" {
  description = "Prefix used for naming ECS resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to ECS resources"
  type        = map(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs where ECS tasks will run"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security Group attached to ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM Execution Role ARN"
  type        = string
}

variable "task_role_arn" {
  description = "IAM Task Role ARN"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch Log Group Name"
  type        = string
}

variable "ecr_repository_url" {
  description = "ECR Repository URL"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the application container"
  type        = number
  default     = 4000
}
