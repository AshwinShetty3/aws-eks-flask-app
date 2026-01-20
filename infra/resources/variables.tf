variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state (must be lowercase)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.state_bucket_name))
    error_message = "Bucket name must be lowercase and contain only letters, numbers, hyphens, and periods."
  }
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-locks"
}
