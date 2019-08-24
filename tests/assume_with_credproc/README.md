# assume with credproc
This tests assumption of a role while using a credential process. Because of logic issues in the way credentials are processed, when on the credential process logical path, you cannot also assume a role.

## current status
### FAILING :x:

## related github issue
https://github.com/hashicorp/aws-sdk-go-base/issues/4

## creds source
Credentials in this test come from a credential process, a simple Bash script that output the credentials.

## run the test

To run the test, follow these steps:

* Make a copy of the `dotenv` file named `.env` (`cp dotenv .env`)
* Optionally provide these values in `.env`:
    * TF_VAR_aws_region
    * TF_VAR_aws_access_key
    * TF_VAR_aws_secret_access_key
* Run `make test`

**NOTE:** Git will not upload `.env` to GitHub since it is included in `.gitignore`. Make sure _not_ to include secrets in the file called `dotenv`.
