# credproc without assume
This is the most basic _credential process_ test. In this test, no roles are assumed, the default profile is used, no S3 backends, just the most basic credential process test.

The credential process tests:
1. [credproc](../credproc)
1. [credproc_assume_role](../credproc_assume_role)
1. [credproc_nondefault_profile](../credproc_nondefault_profile)]

## current status
### PASSING :+1:

## related github issue
None

## creds source
Credentials in this test come from a credential process, a simple Bash script that outputs the credentials.

## run the test

To run the test, follow these steps:

* Make a copy of the `dotenv` file named `.env` (`cp dotenv .env`)
* Provide these values in `.env`:
    * TF_VAR_aws_region
    * TF_VAR_aws_access_key
    * TF_VAR_aws_secret_access_key
* Run `make test`

**NOTE:** Git will not upload `.env` to GitHub since it is included in `.gitignore`. Make sure _not_ to include secrets in the file called `dotenv`.
