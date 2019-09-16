# assume with credproc
This tests assumption of a role while using a credential process. Because of logic issues in the way credentials are processed, when on the credential process logical path, you cannot also assume a role. This is basically the same test as [credproc](../credproc) but adding the assumption of a role to show that causes problems.

**NOTE:** Because this test messes with Terraform to the point where it won't destroy resources, this test uses AWSCLI to delete the IAM role created in the test.

The credential process tests:
1. [credproc](../credproc)
1. [credproc_assume_role](../credproc_assume_role)
1. [credproc_nondefault_profile](../credproc_nondefault_profile)
1. [credproc_s3_backend](../credproc_s3_backend)

## current status
### FAILING :x:

## related github issue
https://github.com/hashicorp/aws-sdk-go-base/issues/4

## creds source
Credentials in this test come from a credential process, a simple Bash script that outputs the credentials.

## run the test

To run the test, follow these steps:

* Make a copy of the `dotenv` file named `.env` (`cp dotenv .env`)
* Provide these values in `.env`:
    * TF_VAR_role_name
    * TF_VAR_aws_region
    * credproc_access_key
    * credproc_secret_access_key
* Run `make`

**NOTE:** Git will not upload `.env` to GitHub since it is included in `.gitignore`. Make sure _not_ to include secrets in the file called `dotenv`.
