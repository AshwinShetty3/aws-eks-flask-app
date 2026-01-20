# Staging Environment Outputs

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.compute.instance_id
}

output "ec2_private_ip" {
  value = module.compute.instance_private_ip
}

output "ssh_key_path" {
  value = module.compute.private_key_path
}

output "s3_bucket_name" {
  value = module.storage.bucket_id
}

output "ssm_connect_command" {
  value = "aws ssm start-session --target ${module.compute.instance_id} --region ap-south-1"
}
