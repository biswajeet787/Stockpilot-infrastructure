variable "name_prefix" {
  description = "Common prefix used for naming AWS resources."
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources."
  type        = map(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the RDS subnet group."
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "Security Group ID attached to the RDS instance."
  type        = string
}

variable "db_name" {
  description = "Initial database name."
  type        = string
}

variable "db_username" {
  description = "Master username for PostgreSQL."
  type        = string
}

variable "db_password" {
  description = "Master password for PostgreSQL."
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance type."
  type        = string
}

variable "allocated_storage" {
  description = "Storage size in GB."
  type        = number
}

variable "engine_version" {
  description = "PostgreSQL engine version."
  type        = string
}
