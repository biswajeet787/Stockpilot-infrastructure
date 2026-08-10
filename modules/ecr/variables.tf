variable "name_prefix" {
  description = "Prefix used for naming the ECR repository"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to the ECR repository"
  type        = map(string)
}
