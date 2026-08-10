resource "aws_iam_policy" "ecs_s3_policy" {

  name        = "${var.name_prefix}-ecs-s3-policy"
  description = "Allows ECS task to access the S3 bucket"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = [
          var.s3_bucket_arn
        ]
      },

      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]

        Resource = [
          "${var.s3_bucket_arn}/*"
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "ecs_s3_policy_attachment" {

  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.ecs_s3_policy.arn
}
