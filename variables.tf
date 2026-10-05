variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
}
variable "project_name" {
  description = "Project name used for naming AWS resources"
  type        = string
}
variable "environment" {
  description = "Deployment environment"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "public_subnet_1_cidr" {
  description = "CIDR block for Public Subnet 1"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for Public Subnet 2"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for Private Subnet 1"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for Private Subnet 2"
  type        = string
}

variable "availability_zone_1" {
  description = "Availability Zone for Public and Private Subnet 1"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone for Public and Private Subnet 2"
  type        = string
}




variable "db_name" {
  description = "Initial PostgreSQL database name"
  type        = string
}

variable "db_username" {
  description = "Master username for PostgreSQL"
  type        = string
}

variable "db_password" {
  description = "Master password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance (GB)"
  type        = number
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair Name"

  type = string
}

variable "database_url" {

  description = "PostgreSQL database connection string"

  type = string

  sensitive = true

}

variable "client_origin" {
  description = "Allowed client origin for the backend"
  type        = string
}

variable "jwt_expires_in" {
  description = "JWT expiration duration"
  type        = string
}

variable "jwt_secret" {
  description = "JWT signing secret"
  type        = string
  sensitive   = true
}


variable "ses_from_email" {

  description = "Verified email address used by Amazon SES"

  type = string

}

