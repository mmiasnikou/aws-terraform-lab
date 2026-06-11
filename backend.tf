terraform {
  backend "s3" {
    bucket         = "homelab-tfstate"
    key            = "aws-terraform-lab/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-state-lock"
    encrypt        = true
  }
}
