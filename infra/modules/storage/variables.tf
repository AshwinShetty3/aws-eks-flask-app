variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "testproj01"
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be lowercase)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be lowercase and contain only letters, numbers, hyphens, and periods."
  }
}
