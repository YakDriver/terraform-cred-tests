provider "aws" {
  region     = var.aws_region
}

# Grab the ARN of the current logged in user
data "aws_caller_identity" "current" {}

# create a role which allows the current user to assume it
resource "aws_iam_role" "tf-test-26254acfae64" {
  name = "tf-test-26254acfae64"
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
}

resource "aws_iam_role_policy" "tf-test-26254acfae64" {
  name = "tf-test-26254acfae64"
  role = "${aws_iam_role.tf-test-26254acfae64.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:*",
        "s3:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# configure this provider alias to use the IAM Role created above
provider "aws" {
  alias = "iamrole"

  assume_role {
    role_arn = "${aws_iam_role.tf-test-26254acfae64.arn}"
  }
}

data "aws_caller_identity" "new_role" {
  provider = "aws.iamrole"
}
