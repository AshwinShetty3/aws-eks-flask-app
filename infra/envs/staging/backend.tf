# Backend Configuration - Uncomment after running resources/ first
# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-testproj01-staging"
#     key            = "staging/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-locks-staging"
#     encrypt        = true
#   }
# }
