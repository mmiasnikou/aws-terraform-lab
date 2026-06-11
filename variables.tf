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
