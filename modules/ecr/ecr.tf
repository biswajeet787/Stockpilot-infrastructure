resource "aws_ecr_repository" "backend" {

  name = "${var.name_prefix}-backend"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-backend"
    }
  )

}
