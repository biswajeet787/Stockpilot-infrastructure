resource "aws_iam_role_policy_attachment" "jenkins_ecr_policy" {

  role = aws_iam_role.jenkins_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"

}

resource "aws_iam_role_policy_attachment" "jenkins_ecs_policy" {

  role = aws_iam_role.jenkins_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"

}


resource "aws_iam_role_policy_attachment" "jenkins_cloudwatch_policy" {

  role = aws_iam_role.jenkins_role.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"

}