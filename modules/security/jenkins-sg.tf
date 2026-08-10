resource "aws_security_group" "jenkins_sg" {

  name        = "${var.name_prefix}-jenkins-sg"

  description = "Security Group for Jenkins Server"

  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-jenkins-sg"
    }
  )
}



resource "aws_vpc_security_group_ingress_rule" "jenkins_ssh" {

  security_group_id = aws_security_group.jenkins_sg.id

  ip_protocol = "tcp"

  from_port = 22

  to_port = 22

  cidr_ipv4 = "0.0.0.0/0"

}



resource "aws_vpc_security_group_ingress_rule" "jenkins_web" {

  security_group_id = aws_security_group.jenkins_sg.id

  ip_protocol = "tcp"

  from_port = 8080

  to_port = 8080

  cidr_ipv4 = "0.0.0.0/0"

}


resource "aws_vpc_security_group_egress_rule" "jenkins_outbound" {

  security_group_id = aws_security_group.jenkins_sg.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

}