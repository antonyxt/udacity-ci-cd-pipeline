#!/usr/bin/env bash

# CREATE RESOURCES USING TERRAFORM
terraform init
terraform plan -out solution.plan
terraform apply "solution.plan"

# DEPLOY APP
az webapp up \
      --name udacity-azure-course-project2-cicd-appservice \
      --resource-group AzureDevops \
      --sku B1 \
	  --logs \
	  --runtime PYTHON:3.12
