output "instance_id" {
  description = "Jenkins EC2 Instance ID"

  value = aws_instance.jenkins.id
}

output "instance_arn" {
  description = "Jenkins EC2 Instance ARN"

  value = aws_instance.jenkins.arn
}

output "public_ip" {
  description = "Public IP Address of Jenkins Server"

  value = aws_instance.jenkins.public_ip
}

output "private_ip" {
  description = "Private IP Address of Jenkins Server"

  value = aws_instance.jenkins.private_ip
}

output "public_dns" {
  description = "Public DNS of Jenkins Server"

  value = aws_instance.jenkins.public_dns
}