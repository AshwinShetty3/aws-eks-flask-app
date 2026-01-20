# Terraform AWS Infrastructure

Multi-environment AWS infrastructure with VPC, EC2, and S3.

## Project Structure

```
├── resources/          # State infrastructure (run first)
├── modules/
│   ├── vpc/           # VPC, subnets, gateways
│   ├── compute/       # EC2, security groups, IAM
│   └── storage/       # S3 bucket
├── envs/
│   ├── dev/           # Development environment
│   ├── staging/       # Staging environment
│   └── prod/          # Production environment
└── keys/              # SSH keys (auto-generated)
```

## Quick Start

### 1. Create State Infrastructure

```bash
cd resources
terraform init
terraform apply
```

### 2. Deploy Dev Environment

```bash
cd envs/dev
# Uncomment backend.tf after step 1
terraform init
terraform plan
terraform apply
```

### 3. Connect to EC2 via SSM

```bash
aws ssm start-session --target <instance-id> --region ap-south-1
```

## Environment Differences

| Setting       | Dev         | Staging     | Prod        |
| ------------- | ----------- | ----------- | ----------- |
| Instance Type | t3.micro    | t3.small    | t3.medium   |
| Volume Size   | 20 GB       | 30 GB       | 50 GB       |
| VPC CIDR      | 10.0.0.0/16 | 10.1.0.0/16 | 10.2.0.0/16 |
