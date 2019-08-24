#!make
include .env
unexport $(env | grep TF_LOG | sed 's/=.*//')
unexport $(env | grep TF_VAR | sed 's/=.*//')
unexport $(env | grep AWS_ | sed 's/=.*//')
export $(shell sed 's/=.*//' .env)
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
color := "\\033[36m"
color_off := "\\033[0m"

default: test

actual_test:
	@echo "$(color)===> Running test $(current_dir)...$(color_off)"
	@env | sort > make_env.log
	@terraform -v
	@terraform init
	@terraform apply -auto-approve || (echo "$(color)===> Test FAILED with code $$?! (Run 'make clean' to clean up.)$(color_off)"; exit 1)
	@echo "$(color)===> Test $(current_dir) ran SUCCESSFULLY$(color_off)"

destroy:
	@echo "$(color)===> Destroying resources...$(color_off)"
	@terraform destroy -input=false -force || (echo "$(color)===> Destroy resources FAILED. Dangling resources may remain. (Run 'make clean_files' to clean up files.)$(color_off)"; exit 1)

clean_files:
	@echo "$(color)===> Cleaning up files...$(color_off)"
	@-rm -rf .terraform/
	@-rm *tfstate*
	@-rm *.log

clean: destroy clean_files

test: actual_test clean

unclean_test: actual_test

.PHONY: actual_test destroy clean_files clean test unclean_test
