provider "aws" {
  profile = "default"
  region  = var.aws_region
}

# Grab the ARN of the current logged in user
data "aws_caller_identity" "current" {}
