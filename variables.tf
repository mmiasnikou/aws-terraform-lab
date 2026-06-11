variable "project" {
  description = "Project name, used for naming and tagging."
  type        = string
  default     = "homelab"
}

variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI. Dummy on LocalStack (no real images to look up)."
  type        = string
  default     = "ami-1234567890abcdef0"
}

variable "agent_count" {
  description = "Number of worker nodes."
  type        = number
  default     = 2
}
