resource "aws_ecs_service" "main" {

  name            = "${var.name_prefix}-service"

  cluster         = aws_ecs_cluster.main.id

  task_definition = aws_ecs_task_definition.main.arn

  desired_count   = 0

  launch_type     = "FARGATE"

  network_configuration {

    subnets = var.private_subnet_ids

    security_groups = [
      var.ecs_security_group_id
    ]

    assign_public_ip = false

  }

    load_balancer {

    target_group_arn = var.target_group_arn

    container_name   = "${var.name_prefix}-container"

    container_port   = var.container_port

  }

    depends_on = [
    aws_ecs_task_definition.main
  ]

}