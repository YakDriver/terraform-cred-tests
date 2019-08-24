#!make
include .env
export $(shell sed 's/=.*//' .env)
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
color := "\\033[36m"
color_off := "\\033[0m"

.PHONY: actual_test clean

default: test

actual_test:
	@echo "$(color)===> Running test $(current_dir)...$(color_off)"
	@terraform -v
	@terraform init
	@terraform apply -auto-approve || (echo "$(color)===> Test FAILED with code $$?! (Run 'make clean' to clean up.)$(color_off)"; exit 1)
	@echo "$(color)===> Test $(current_dir) ran SUCCESSFULLY$(color_off)"

clean:
	@echo "$(color)===> Cleaning up test...$(color_off)"
	@terraform destroy -input=false -force
	@rm -rf .terraform/
	@rm *tfstate*
	@rm *.log

test: actual_test clean

unclean_test: actual_test
