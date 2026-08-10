resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-${var.environment}-nat-eip"
    Project     = var.project_name
    Environment = var.environment
  }
}




resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_1.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-nat-gateway"
    Project     = var.project_name
    Environment = var.environment
  }
}
