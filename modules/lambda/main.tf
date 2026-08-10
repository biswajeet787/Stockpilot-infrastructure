data "archive_file" "notification_lambda_zip" {

  type = "zip"

  source_dir = "${path.module}/notification"

  output_path = "${path.module}/notification.zip"
}

resource "aws_lambda_function" "notification" {

  function_name = "${var.name_prefix}-notification-lambda"

  role = var.lambda_role_arn

  handler = "index.handler"

  runtime = "nodejs22.x"

  filename = data.archive_file.notification_lambda_zip.output_path

  source_code_hash = data.archive_file.notification_lambda_zip.output_base64sha256

  timeout = 30

  memory_size = 256

  environment {

    variables = {

      DATABASE_URL = var.database_url

      SES_FROM_EMAIL = var.ses_from_email
    }
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-notification-lambda"
    }
  )
}