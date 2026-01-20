# Prod Environment - Main Configuration

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  region       = var.region
  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
}

# Storage Module
module "storage" {
  source = "../../modules/storage"

  project_name = var.project_name
  environment  = var.environment
  bucket_name  = var.app_bucket_name
}

# Compute Module
module "compute" {
  source = "../../modules/compute"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_3_id
  instance_type     = var.instance_type
  root_volume_size  = var.root_volume_size
  key_path          = var.key_path
  s3_bucket_arn     = module.storage.bucket_arn
}
