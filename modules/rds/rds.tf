resource "aws_db_subnet_group" "main" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-db-subnet-group"
    }
  )
}



resource "aws_db_instance" "main" {

  identifier = "${var.name_prefix}-postgres"

  engine         = "postgres"
  engine_version = var.engine_version

  instance_class = var.db_instance_class

  allocated_storage = var.allocated_storage
  storage_type       = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_security_group_id]

  publicly_accessible = false
  multi_az            = false

  backup_retention_period = 0

  skip_final_snapshot = true
  deletion_protection = false

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-postgres"
    }
  )
}