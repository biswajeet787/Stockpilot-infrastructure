resource "aws_iam_policy" "lambda_ses_policy" {

  name = "${var.name_prefix}-lambda-ses-policy"

  description = "Allow Lambda to send emails using Amazon SES"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {

        Effect = "Allow"

        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ]

        Resource = "*"

      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_ses_attachment" {

  role = aws_iam_role.lambda_role.name

  policy_arn = aws_iam_policy.lambda_ses_policy.arn

}