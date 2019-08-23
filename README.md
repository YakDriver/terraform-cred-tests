# terraform-cred-tests
Working and non-working tests of Terraform's credential use.

## quick and dirty

Each test (each is a subdirectory of the `tests/` directory) has a README and a Makefile. Follow the steps in the individual test's README and run `make`:

```console
$ make test
```

## contributions

Adding working and, especially, non-working tests is a great help. Fork and open a pull request!

Making a new test is simple:
1. Fork & clone this repo
1. Find the most similar existing test
1. Go to your local clone directory
1. `git checkout -b my-awesome-test`
1. `cd tests`
1. `cp -R existing_similar_test new_name_for_your_test`
1. Edit the `README.md`, `dotenv` and `*.tf` files for your test
1. `git add .`
1. `git commit -m "My awesome test"`
1. `git push -u my-awesome-test`
1. Go to GitHub and open a pull request!

## work in progress notes

Variables affecting credentialling:
* static
* assume role
* S3 backend
* credential process
* profile
* config file
* credential file
* environment variables
* token
* workspaces (?)

Where tests can be compared to determine the source of the problem:
* Terraform
* AWS CLI
* AWS SDK Go

Specific cases not captured in tests yet:
* Terraform assumes Role T (Profile T) (#8052)
    * Profile T = Profile R
    * Profile R = Profile A
    * Config + Credential

S3 Backend
```hcl
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
```

Assume role
```hcl
provider "aws" {
  assume_role = "${var.workspace_iam_roles[terraform.workspace]}"
}
```