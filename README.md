# 🚀 Flask App on AWS EKS

A production-ready Flask application deployed on AWS EKS using Terraform, Docker, and Kubernetes.

![AWS](https://img.shields.io/badge/AWS-EKS-orange?logo=amazon-aws)
![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?logo=terraform)
![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-1.29-blue?logo=kubernetes)

---

## 📋 Project Overview

This project demonstrates a complete DevOps workflow:

| Component            | Technology   | Purpose                       |
| -------------------- | ------------ | ----------------------------- |
| **Application**      | Python Flask | Simple web API                |
| **Containerization** | Docker       | Package app with dependencies |
| **Registry**         | AWS ECR      | Store Docker images           |
| **Infrastructure**   | Terraform    | IaC for AWS resources         |
| **Orchestration**    | AWS EKS      | Managed Kubernetes            |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    AWS (ap-south-1)                         │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                     VPC                                │ │
│  │  ┌──────────────┐    ┌───────────────────────────────┐ │ │
│  │  │ Public       │    │     Private Subnets           │ │ │
│  │  │ Subnet       │    │  ┌─────────────────────────┐  │ │ │
│  │  │ (NAT GW)     │    │  │   EKS Node Group        │  │ │ │
│  │  │              │    │  │  ┌──────┐  ┌──────┐     │  │ │ │
│  │  │              │    │  │  │Pod 1 │  │Pod 2 │     │  │ │ │
│  │  │              │    │  │  └──────┘  └──────┘     │  │ │ │
│  │  └──────────────┘    │  └─────────────────────────┘  │ │ │
│  │                      └───────────────────────────────┘ │ │
│  └────────────────────────────────────────────────────────┘ │
│                              ↑                              │
│                    EKS Control Plane (AWS Managed)          │
└─────────────────────────────────────────────────────────────┘
```

---

## 📁 Project Structure

```
.
├── app/                    # Flask application
│   ├── app.py             # Main application
│   └── Dockerfile         # Container definition
├── k8s/                   # Kubernetes manifests
│   ├── deployment.yaml    # Pod deployment
│   └── service.yaml       # Service exposure
├── infra/                 # Terraform infrastructure
│   ├── modules/
│   │   ├── vpc/          # VPC, subnets, NAT
│   │   ├── compute/      # EC2 instances
│   │   ├── storage/      # S3 buckets
│   │   └── eks/          # EKS cluster
│   └── envs/
│       ├── dev/          # Development environment
│       ├── staging/      # Staging environment
│       └── prod/         # Production environment
└── README.md
```

---

## 🚀 Quick Start

### Prerequisites

- AWS CLI configured
- Terraform >= 1.0
- Docker Desktop
- kubectl

### 1. Deploy Infrastructure

```bash
cd infra/envs/dev
terraform init
terraform apply
```

### 2. Configure kubectl

```bash
aws eks update-kubeconfig --region ap-south-1 --name testproj01-dev-cluster
```

### 3. Build & Push Docker Image

```bash
cd app
docker buildx build --platform linux/amd64 -t my_flask-app:1.0 .
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.ap-south-1.amazonaws.com
docker tag my_flask-app:1.0 <account-id>.dkr.ecr.ap-south-1.amazonaws.com/my-flask-app:1.0
docker push <account-id>.dkr.ecr.ap-south-1.amazonaws.com/my-flask-app:1.0
```

### 4. Deploy to EKS

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### 5. Test

```bash
kubectl port-forward service/flask-service 8080:80
curl http://localhost:8080
# Output: Hello from Kubernetes on AWS!
```

---

## 💰 Cost Estimate

| Resource           | Monthly Cost |
| ------------------ | ------------ |
| EKS Control Plane  | ~$73         |
| 2x t3.medium nodes | ~$60         |
| NAT Gateway        | ~$32         |
| **Total**          | **~$165**    |

---

## 🧹 Cleanup

To avoid ongoing charges:

```bash
cd infra/envs/dev
terraform destroy
```

---

## 📝 License

MIT License
