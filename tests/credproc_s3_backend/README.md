# credproc with s3 backend
This test covers using a _credential process_ with an S3 backend. At one point, this test did not work but now does. 

This test is a bit trickier than the others because variables cannot be used to provide S3 backend configuration. **This test has no `main.tf`.** To maintain the same ease of running the test as the other tests, the Makefile uses sed to replace placeholders in a file called `main.pre-tf` which then becomes `main.tf`.

The credential process tests:
1. [credproc](../credproc)
1. [credproc_assume_role](../credproc_assume_role)
1. [credproc_nondefault_profile](../credproc_nondefault_profile)
1. [credproc_s3_backend](../credproc_s3_backend)

## current status
### PASSING :+1:

## related github issue
https://github.com/terraform-providers/terraform-provider-aws/issues/6913

## creds source
Credentials in this test come from a credential process, a simple Bash script that outputs the credentials.

## run the test

To run the test, follow these steps:

* Make a copy of the `dotenv` file named `.env` (`cp dotenv .env`)
* Provide these values in `.env`:
    * TF_VAR_aws_region
    * s3_region
    * s3_backend_bucket
    * s3_backend_key
    * credproc_access_key
    * credproc_secret_access_key
* Run `make`

**NOTE:** Git will not upload `.env` to GitHub since it is included in `.gitignore`. Make sure _not_ to include secrets in the file called `dotenv`.
