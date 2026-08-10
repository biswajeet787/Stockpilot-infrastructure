output "bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.main.bucket
}

output "bucket_arn" {
  description = "S3 Bucket ARN"
  value       = aws_s3_bucket.main.arn
}

output "bucket_id" {
  description = "S3 Bucket ID"
  value       = aws_s3_bucket.main.id
}