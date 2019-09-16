# credproc and a non-default profile
This tests using the credential process to obtain credentials. This is basically the same test as [credproc_without_assume](../credproc_without_assume) except it uses a non-default profile (i.e., `credproc`) to show that aspect is working.

The credential process tests:
1. [credproc](../credproc)
1. [credproc_assume_role](../credproc_assume_role)
1. [credproc_nondefault_profile](../credproc_nondefault_profile)
1. [credproc_s3_backend](../credproc_s3_backend)

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
    * credproc_access_key
    * credproc_secret_access_key
* Run `make`

**NOTE:** Git will not upload `.env` to GitHub since it is included in `.gitignore`. Make sure _not_ to include secrets in the file called `dotenv`.
