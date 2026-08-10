variable "name_prefix" {

  description = "Prefix used for Lambda resources"

  type = string
}

variable "common_tags" {

  description = "Common tags for Lambda resources"

  type = map(string)
}

variable "lambda_role_arn" {

  description = "IAM Role ARN used by Lambda"

  type = string
}

variable "database_url" {

  description = "PostgreSQL database connection string"

  type = string

  sensitive = true
}

variable "ses_from_email" {

  description = "Verified SES sender email"

  type = string
}