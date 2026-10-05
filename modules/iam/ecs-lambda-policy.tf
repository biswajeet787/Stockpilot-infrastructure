resource "aws_iam_policy" "ecs_lambda_policy" {

  name        = "${var.name_prefix}-ecs-lambda-policy"
  description = "Allows ECS task to invoke the notification Lambda"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [
          "lambda:InvokeFunction"
        ]

        Resource = var.notification_lambda_arn
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "ecs_lambda_policy_attachment" {

  role = aws_iam_role.ecs_task_role.name

  policy_arn = aws_iam_policy.ecs_lambda_policy.arn
}
