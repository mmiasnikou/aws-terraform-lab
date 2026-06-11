# aws-terraform-lab

AWS infrastructure provisioned with Terraform, developed locally against **LocalStack**
(no real AWS account — emulated AWS APIs in Docker). The same Terraform code would run
against real AWS with plain `terraform`; `tflocal` injects LocalStack endpoints at runtime.

## What it provisions

- **VPC** (`10.0.0.0/16`) with a public subnet, internet gateway, route table
- **Security group** with SSH/HTTP/HTTPS ingress rules
- **IAM role** + instance profile for EC2
- **EC2**: 1 server + 2 agent instances
- **Remote state** in S3 with DynamoDB state locking (bootstrapped separately)

## Note on scope

LocalStack mocks the EC2 API — instances are not real VMs (no SSH, no running workloads).
This project demonstrates the **AWS Terraform provider**: resource modeling, the
plan/apply lifecycle, the dependency graph, and remote state — not a live cluster.

## Layout

| File | Purpose |
|------|---------|
| `provider.tf` | AWS provider + default tags |
| `backend.tf` | S3 remote state + DynamoDB lock |
| `variables.tf` | inputs |
| `vpc.tf` | VPC |
| `network.tf` | subnet, IGW, route table |
| `security_groups.tf` | firewall rules |
| `iam.tf` | role + instance profile |
| `ec2.tf` | instances |
| `outputs.tf` | key resource IDs |
| `bootstrap/` | one-time: creates the S3 bucket + lock table |

## Usage

```bash
# 0. start LocalStack
docker compose up -d

# 1. create the state backend (once)
cd bootstrap && tflocal init && tflocal apply -auto-approve && cd ..

# 2. provision
tflocal init
tflocal apply -auto-approve

# 3. inspect
awslocal ec2 describe-instances
awslocal ec2 describe-vpcs

# 4. tear down
tflocal destroy -auto-approve
```

## Stack

Terraform · AWS provider · LocalStack · S3 remote state · DynamoDB locking
