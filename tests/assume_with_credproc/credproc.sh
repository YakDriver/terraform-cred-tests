#!/bin/bash

echo <<JSON "{
  \"Version\": 1,
  \"AccessKeyId\": \"${TF_VAR_aws_access_key}\",
  \"SecretAccessKey\": \"${TF_VAR_aws_secret_access_key}\"
}"
JSON
