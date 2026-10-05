data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {
    name = "name"

    values = [
      #"ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20260714"
    ]
  }

  filter {
    name = "virtualization-type"

    values = ["hvm"]
  }
}



resource "aws_instance" "jenkins" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [
    var.jenkins_security_group_id
  ]

  key_name = var.key_name

  iam_instance_profile = var.iam_instance_profile

  associate_public_ip_address = true

  user_data = file("${path.module}/userdata.sh")

  root_block_device {
  volume_type = var.root_volume_type
  volume_size = var.root_volume_size
  encrypted   = true
}

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-jenkins"
    }
  )
}
