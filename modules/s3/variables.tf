variable "name_prefix" {
  description = "Prefix used for naming AWS resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}