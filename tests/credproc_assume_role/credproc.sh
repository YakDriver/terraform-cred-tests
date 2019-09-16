#!/bin/bash

echo <<JSON "{
  \"Version\": 1,
  \"AccessKeyId\": \"${credproc_access_key}\",
  \"SecretAccessKey\": \"${credproc_secret_access_key}\"
}"
JSON
