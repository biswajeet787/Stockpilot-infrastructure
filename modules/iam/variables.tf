variable "name_prefix" {
  description = "Prefix used for naming IAM resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to IAM resources"
  type        = map(string)
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}


variable "notification_lambda_arn" {
 description = "ARN of the notification Lambda function"
 type        = string
}
