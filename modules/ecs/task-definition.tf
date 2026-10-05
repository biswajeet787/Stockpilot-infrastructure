resource "aws_ecs_task_definition" "main" {

  family                   = "${var.name_prefix}-task"

  network_mode             = "awsvpc"

  requires_compatibilities = ["FARGATE"]

  cpu                      = "256"

  memory                   = "512"

  execution_role_arn       = var.execution_role_arn

  task_role_arn            = var.task_role_arn


    container_definitions = jsonencode([
    {
      name      = "${var.name_prefix}-container"

      image     = "${var.ecr_repository_url}:latest"

      essential = true

environment = [
  {
    name  = "CLIENT_ORIGIN"
    value = var.client_origin
  },
  {
    name  = "DATABASE_URL"
    value = var.database_url
  },
  {
    name  = "JWT_EXPIRES_IN"
    value = var.jwt_expires_in
  },
  {
    name  = "JWT_SECRET"
    value = var.jwt_secret
  },
  {
    name  = "PORT"
    value = "4000"
  },
  {
    name  = "NOTIFICATION_LAMBDA_NAME"
    value = var.notification_lambda_name
  }
]

portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

            logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = var.log_group_name
          awslogs-region        = "ap-south-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

}