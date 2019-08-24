provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}

# Grab the ARN of the current logged in user
data "aws_caller_identity" "current" {}

# create a role which allows the current user to assume it
resource "aws_iam_role" "tf-test-6d3868d9bed3" {
  name = "tf-test-6d3868d9bed3"
  path = "/test/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${data.aws_caller_identity.current.arn}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  provisioner "local-exec" {
    command = "sleep 30"
  }
}

# configure this provider alias to use the IAM Role created above
provider "aws" {
  profile = "credproc"
  alias = "iamrole"

  assume_role {
    role_arn = "${aws_iam_role.tf-test-6d3868d9bed3.arn}"
  }
}

data "aws_caller_identity" "new_role" {
  provider = "aws.iamrole"
}
