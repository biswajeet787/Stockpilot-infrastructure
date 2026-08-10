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