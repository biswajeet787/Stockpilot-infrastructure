module "security" {
  source = "./modules/security"

  vpc_id      = aws_vpc.main.id
  name_prefix = local.name_prefix
  common_tags = local.common_tags
}


module "rds" {
  source = "./modules/rds"

  name_prefix = local.name_prefix
  common_tags = local.common_tags

  private_subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  rds_security_group_id = module.security.rds_security_group_id

  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage
  engine_version    = var.engine_version
}


module "alb" {

  source = "./modules/alb"

  vpc_id = aws_vpc.main.id

  public_subnet_ids = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  alb_security_group_id = module.security.alb_security_group_id

  name_prefix = local.name_prefix

  common_tags = local.common_tags

}





module "ecr" {

  source = "./modules/ecr"

  name_prefix = local.name_prefix

  common_tags = local.common_tags

}

module "iam" {
  source = "./modules/iam"

  name_prefix = local.name_prefix

  common_tags = local.common_tags

  s3_bucket_arn = module.s3.bucket_arn

  notification_lambda_arn = module.lambda.lambda_function_arn
}



module "cloudwatch" {

  source = "./modules/cloudwatch"

  name_prefix = local.name_prefix

  common_tags = local.common_tags

}




module "ecs" {

  source = "./modules/ecs"

  name_prefix = local.name_prefix

  common_tags = local.common_tags

  private_subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  ecs_security_group_id = module.security.ecs_security_group_id

  target_group_arn = module.alb.target_group_arn

  execution_role_arn = module.iam.ecs_execution_role_arn

  task_role_arn = module.iam.ecs_task_role_arn

  log_group_name = module.cloudwatch.log_group_name

  ecr_repository_url = module.ecr.repository_url

  container_port = 4000

  notification_lambda_name = module.lambda.lambda_function_name

  database_url   = var.database_url
  client_origin  = var.client_origin
  jwt_expires_in = var.jwt_expires_in
  jwt_secret     = var.jwt_secret



}




module "autoscaling" {

  source = "./modules/autoscaling"

  ecs_cluster_name = module.ecs.cluster_name

  ecs_service_name = module.ecs.service_name

  min_capacity = 1

  max_capacity = 3

  cpu_target_value = 70

}


module "s3" {
  source = "./modules/s3"

  name_prefix = local.name_prefix
  common_tags = local.common_tags
}



module "jenkins" {

  source = "./modules/jenkins"

  name_prefix = local.name_prefix

  common_tags = local.common_tags

  public_subnet_id = aws_subnet.public_1.id

  jenkins_security_group_id = module.security.jenkins_security_group_id

  key_name = var.key_name

  iam_instance_profile = module.iam.jenkins_instance_profile_name

}


module "lambda" {

  source = "./modules/lambda"

  name_prefix = local.name_prefix

  common_tags = local.common_tags

  lambda_role_arn = module.iam.lambda_role_arn

  database_url = var.database_url

  ses_from_email = var.ses_from_email

}


module "ses" {

  source = "./modules/ses"

  sender_email = var.ses_from_email

}
