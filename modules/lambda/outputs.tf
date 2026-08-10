output "lambda_function_name" {

  description = "Notification Lambda Function Name"

  value = aws_lambda_function.notification.function_name
}

output "lambda_function_arn" {

  description = "Notification Lambda Function ARN"

  value = aws_lambda_function.notification.arn
}