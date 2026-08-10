variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}

variable "public_subnet_id" {
  description = "Public subnet for Jenkins EC2"
  type        = string
}

variable "jenkins_security_group_id" {
  description = "Security group for Jenkins"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "c7i-flex.large"
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile"
  type        = string
}

variable "root_volume_size" {
  description = "Root EBS volume size for Jenkins EC2"
  type        = number
  default     = 30
}

variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
  default     = "gp3"
}