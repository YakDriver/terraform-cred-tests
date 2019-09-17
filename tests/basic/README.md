# static creds
The basic test of standard static creds, just to make sure nothing major has gone wrong.

## current status
### PASSING :+1:

## related github issue
None

## creds source
This test specifically uses static credentials defined directly in Terraform rather than in an `~/.aws/credentials` file. That is another test.

## run the test

To run the test, follow these steps:

* Make a copy of the `dotenv` file named `.env` (`cp dotenv .env`)
* Provide these values in `.env`:
    * TF_VAR_aws_region
    * TF_VAR_aws_access_key
    * TF_VAR_aws_secret_access_key
* Run `make test`

**NOTE:** Git will not upload `.env` to GitHub since it is included in `.gitignore`. Make sure _not_ to include secrets in the file called `dotenv`.
