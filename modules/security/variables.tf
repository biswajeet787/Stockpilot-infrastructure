variable "vpc_id" {
  description = "VPC ID where the security groups will be created."
  type        = string
}

variable "name_prefix" {
  description = "Common prefix used for naming AWS resources."
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources."
  type        = map(string)
}