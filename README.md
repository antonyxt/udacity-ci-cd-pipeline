[![Python application test with Github Actions](https://github.com/antonyxt/udacity-ci-cd-pipeline/actions/workflows/pythonapp.yml/badge.svg)](https://github.com/antonyxt/udacity-ci-cd-pipeline/actions/workflows/pythonapp.yml)


# Overview

This repository represents **Project 2** for the [Udacity Azure DevOps Course](https://www.udacity.com/course/cloud-devops-using-microsoft-azure-nanodegree--nd082).  
It stands as a practical demonstration of **Continuous Integration** and **Continuous Delivery** concepts, bringing together the technical finesse and automation skills cultivated throughout the program.

- A modification to the **main branch** of this repository initiates:
  - A **Continuous Integration** workflow via *GitHub Actions*.  
  - A **Continuous Delivery** pipeline through *Azure Pipelines*.

At its core, the project features a **Python Flask Web Application** that provides **housing price predictions** through RESTful API calls.  
The predictions are powered by a **pre-trained scikit-learn (sklearn)** machine learning model, meticulously trained on **Boston housing data**.

## Project Plan
* Trello board: [Udacity Azure Course Project CI/CD pipeline](https://trello.com/b/alLrhhm7/ci-cd-udacity-azure-demo-project)
* Spreadsheet that includes the original and final project plan: [Excel on Github Repo](https://github.com/antonyxt/udacity-ci-cd-pipeline/blob/main/Docs/CI_CD_ProjectPlan.xlsx)


## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

- Add **automated security scans** to detect vulnerabilities in early stages. 
- **Containerize** the application using Docker for consistent environment setup.  
- Implement **Infrastructure as Code (IaC)** with tools like **Terraform** or **Bicep** for automated resource provisioning.  
- Extend the CI/CD pipeline with **integration and load testing** stages.  
- Integrate **monitoring and logging** using **Azure Monitor** or **Application Insights**.  
- Introduce **environment-based deployments** (Dev, Test, Prod) with approval gates.  
- Add **code coverage and quality checks** using tools like **Codecov** or **SonarCloud**.  
- Automate **rollback strategies** and **blue-green deployments** for safer releases.  

## Demo 

<TODO: Add link Screencast on YouTube>

## Screenshots

* Project cloned into Azure Cloud Shell
![Screenshot project cloned into Azure Cloud Shell](https://github.com/antonyxt/udacity-ci-cd-pipeline/blob/main/screenshots/1.Project-Cloned-Azure-Cloud-Shell.png?raw=true)

* make all - perform install, lint, test and finally generate test coverage report as below
![Screenshot project cloned into Azure Cloud Shell](https://github.com/antonyxt/udacity-ci-cd-pipeline/blob/main/screenshots/2.Make-all-passing-test.png?raw=true)

* Project deployed on Azure web service
![Screenshot project cloned into Azure Cloud Shell](https://github.com/antonyxt/udacity-ci-cd-pipeline/blob/main/screenshots/3.Webservice-up-azure-portal-configurations.png?raw=true)
![Screenshot project cloned into Azure Cloud Shell](https://github.com/antonyxt/udacity-ci-cd-pipeline/blob/main/screenshots/4.Webservice-up-running.png?raw=true)

* Output of a test run

* Successful deploy of the project in Azure Pipelines

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell

* Output of streamed log files from deployed application