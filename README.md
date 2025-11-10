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

## Architectural Diagram
![CI CID pipeline Architecture](https://github.com/antonyxt/udacity-ci-cd-pipeline/blob/main/Docs/ci_cd_pipeline.png?raw=true)

## Instructions

### Required Tools

1. Create an [Azure Account](https://portal.azure.com)
2. Create a [GitHub Account](https://github.com)

### Getting Started

1. Open Azure cloud shell
2. Create gpg keys for ssh access to GitHub repo. This creates files with private and public keys in directory ~/.ssh/

```bash
user@Azure:~/ ssh-keygen -t rsa
```

3. Copy the new public key file: id_rsa.pub

```bash
user@Azure:~/ cat ~/.ssh/id_rsa.pub
```

4. Add new key to your GitHub profile , paste the key and add some random name.

5. copy the url from SSH tab of the repo

6. Clone it into your azure cloud shell. Adapt the URL to match your forked repo:

```bash
user@Azure:~/ git clone git@github.com:antonyxt/udacity-ci-cd-pipeline.git
```
### Running the Python project

1. change active directory to newly created project folder
```bash
user@Azure:~/ cd udacity-ci-cd-pipeline
```

2. create new python environment and activate virtual environment
```bash
user@Azure:~/udacity-ci-cd-pipeline/ python3 -m venv ~/.myenv
user@Azure:~/udacity-ci-cd-pipeline/ source ~/.myenv/bin/Activate
```

2. Install dependencies and test the project:

```bash
(.myenv)user@Azure:~/udacity-ci-cd-pipeline/ make all
```

3. Create a webapp and deploy code from a local workspace to the app.

The command is required to run from the folder where the code is present. If necessary adapt parameter values for webapp name (-n; needs to be unique), location (-l) and sku.

Example:

```bash
user@Azure:~/udacity-ci-cd-pipeline/ az webapp up \
                -n udacity-ci-cd-pipeline-axt-acn-appservice \
                -l eastus \
                --sku F1
```

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
