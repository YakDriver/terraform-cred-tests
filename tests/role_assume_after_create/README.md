# assume after create
This tests assumption of a newly created role. Due to eventual consistency, it takes 10-20 seconds after creation before a role can be assumed. This test fails because of that.

## current status
### FAILING :x:

## related github issue
https://github.com/terraform-providers/terraform-provider-aws/issues/6566

## creds source
Credentials in this test come from your configured AWS CLI profile and `~/.aws/credentials`.

## run the test

To run the test, follow these steps:

* Make a copy of the `dotenv` file named `.env` (`cp dotenv .env`)
* Optionally provide these values in `.env`:
    * TF_VAR_aws_region
* Run `make test`

## a workaround

There's a pretty easy, ugly workaround for this. See it here: [role_assume_after_create_workaround](../role_assume_after_create_workaround).

**NOTE:** Git will not upload `.env` to GitHub since it is included in `.gitignore`. Make sure _not_ to include secrets in the file called `dotenv`.
