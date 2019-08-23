#!make
include .env
export $(shell sed 's/=.*//' .env)
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
color := "\\033[36m"

.PHONY: actual_test clean

default: test

actual_test:
	@echo "$(color)===> Running test $(current_dir)..."
	@terraform init
	@terraform apply -auto-approve || (echo "Test failed! $$?"; exit 1)
	@echo "$(color)===> Test $(current_dir) ran SUCCESSFULLY"

clean: actual_test
	@echo "$(color)===> Cleaning up test..."
	@terraform destroy -input=false -force
	@rm -rf .terraform/
	@rm *tfstate*
	@rm *.log

test: clean

unclean_test: actual_test
