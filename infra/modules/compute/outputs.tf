output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.private_ec2.id
}

output "instance_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.private_ec2.private_ip
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.private_ec2.arn
}

output "security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.private_ec2.id
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.ec2_ssm_role.arn
}

output "key_pair_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.ec2_key.key_name
}

output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}
