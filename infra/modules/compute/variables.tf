variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "testproj01"
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GB"
  type        = number
  default     = 20
}

variable "key_path" {
  description = "Path to save the SSH private key"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket for EC2 access"
  type        = string
}
