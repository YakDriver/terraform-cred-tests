# terraform-cred-tests
Working and non-working tests of Terraform's credential use.

## quick and dirty

Each test (each is a subdirectory of the `tests/` directory) has a README and a Makefile. Follow the steps in the individual test's README and run `make`:

```console
$ make test
```

## current tests

<!-- REPLACE BEGIN -->
| Test  | Status | Issue |
| ------------- | ------------- | ------------- |
| [basic](tests/basic) | :+1: | None |
| [credproc](tests/credproc) | :+1: | None |
| [credproc_assume_role](tests/credproc_assume_role) | :x: | [hashicorp/aws-sdk-go-base#4](https://github.com/hashicorp/aws-sdk-go-base/issues/4) |
| [credproc_nondefault_profile](tests/credproc_nondefault_profile) | :+1: | [terraform-providers/terraform-provider-aws#6913](https://github.com/terraform-providers/terraform-provider-aws/issues/6913) |
| [credproc_s3_backend](tests/credproc_s3_backend) | :+1: | [terraform-providers/terraform-provider-aws#6913](https://github.com/terraform-providers/terraform-provider-aws/issues/6913) |
| [role_assume_after_create](tests/role_assume_after_create) | :x: | [terraform-providers/terraform-provider-aws#6566](https://github.com/terraform-providers/terraform-provider-aws/issues/6566) |
| [role_assume_after_create_workaround](tests/role_assume_after_create_workaround) | :+1: | [terraform-providers/terraform-provider-aws#6566](https://github.com/terraform-providers/terraform-provider-aws/issues/6566) |
<!-- REPLACE END -->

## contributions

Adding working and, especially, non-working tests by forking and opening a pull request.

Making a new test:
1. Fork & clone this repo
1. Find the most similar existing test
1. Go to your local clone directory
1. `git checkout -b my-awesome-test`
1. `cd tests`
1. `cp -R existing_similar_test new_name_for_your_test`
1. `cd new_name_for_your_test`
1. Edit the `README.md`, `dotenv` and `*.tf` files in `new_name_for_your_test`
1. Run your test using the makefile (`make` which is equivalent to `make test`) - make will setup the environment and run Terraform for you
    * If your test is successful, `make` will `destroy` and clean up in the same pass
    * If your test is not successful, `make clean` should get rid of the resources and files (will also get rid of the logs which are helpful in debugging) (**WARNING**: some tests might leave resources that you'll have to manually delete in the AWS console/CLI)
1. Edit this `README.md` with the test name and status
1. `git add .`
1. `git commit -m "Add new test for (briefly describe the test)"`
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

* [Pull request to fix](https://github.com/hashicorp/aws-sdk-go-base/pull/5)
* [Issue on GitHub](https://github.com/hashicorp/aws-sdk-go-base/issues/4)
