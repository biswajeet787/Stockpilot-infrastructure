variable "name_prefix" {
  description = "Prefix used for naming CloudWatch resources"
  type        = string
}
variable "common_tags" {
  description = "Common tags applied to CloudWatch resources"
  type        = map(string)
}
variable "retention_in_days" {
  description = "Number of days to retain log events"
  type        = number
  default     = 30
}
