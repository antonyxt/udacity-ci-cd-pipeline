#!/usr/bin/env bash

# CREATE RESOURCES USING TERRAFORM
terraform init
terraform plan -out solution.plan
terraform apply "solution.plan"

# DEPLOY APP
az webapp up \
      --name udacity-ci-cd-pipeline-axt-acn-appservice \
      --resource-group AzureDevops \
      --sku B1 \
	  --logs \
	  --runtime PYTHON:3.10
