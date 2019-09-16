variable "role_name" {
  description = "Name of the IAM role to create"
  type        = "string"
}

variable "aws_region" {
  description = "Region where testing happens"
  type        = "string"
  default     = "us-east-1"
}
