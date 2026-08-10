resource "aws_iam_role" "jenkins_role" {

  name = "${var.name_prefix}-jenkins-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-jenkins-role"
    }
  )
}

resource "aws_iam_instance_profile" "jenkins_profile" {

  name = "${var.name_prefix}-jenkins-instance-profile"

  role = aws_iam_role.jenkins_role.name
}