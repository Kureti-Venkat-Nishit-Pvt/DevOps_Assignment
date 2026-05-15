# DRAGOT – End-to-End Azure DevOps CI/CD Project - - ![Branch](https://img.shields.io/badge/Current%20Branch-Mark__6-green)

## Project Overview

DRAGOT is a complete Enterprise-Style DevOps CI/CD Implementation using:

* Azure DevOps Pipelines
* Terraform Infrastructure as Code (IaC)
* Docker Containerization
* Azure Container Registry (ACR)
* Azure Web App for Containers
* Azure Kubernetes Service (AKS)
* Helm Charts
* Python Automation Scripts
* Dynamic Azure Resource Reporting

This project demonstrates how to automate the complete lifecycle of a cloud-native application deployment using Infrastructure as Code, CI/CD pipelines, containerization, and Kubernetes orchestration.

---

# Project Architecture

```text
Developer Commit
       │
       ▼
GitHub Repository
       │
       ▼
Azure DevOps Pipeline
       │
       ├── Terraform Infrastructure Provisioning
       │
       ├── Docker Image Build
       │
       ├── Push Image to Azure Container Registry (ACR)
       │
       ├── Manual Approval Stage
       │
       ├── Deploy to Azure Web App
       │
       └── Optional AKS Deployment using Helm
```

---

# Objectives

* Create an end-to-end DevOps setup using Azure DevOps by creating a project, repository, and pipeline to build a sample Java/Python application using GitHub as the repository.
* Provision Azure Resources including:

  * Azure Subscription
  * Resource Group
  * Azure Kubernetes Service (AKS)
  * Azure Web App
  * Azure Container Registry (ACR)
* Containerize the application using Docker and push the image into Azure Container Registry.
* Create the Pipeline to use a Self-Hosted Agent for building and deploying the application.
* Deploy the containerized application into Azure Web App.
* Optionally deploy the application into AKS using Helm Charts for scalable Kubernetes-based hosting.
* Generate Dynamic Azure Resource Inventory Reports automatically after deployment.

---

# Environments

This project supports two deployment environments:

| Environment | Purpose               | TFVars File   |
| ----------- | --------------------- | ------------- |
| Dev         | Development & Testing | `dev.tfvars`  |
| Prod        | Production Deployment | `prod.tfvars` |

The environment is selected dynamically from Azure DevOps pipeline parameters.

---

# Technologies Used

| Technology               | Purpose                       |
| ------------------------ | ----------------------------- |
| Azure DevOps             | CI/CD Pipeline                |
| GitHub                   | Source Code Repository        |
| Terraform                | Infrastructure Provisioning   |
| Docker                   | Containerization              |
| Azure Container Registry | Image Storage                 |
| Azure Web App            | Application Hosting           |
| Azure Kubernetes Service | Kubernetes Hosting            |
| Helm                     | Kubernetes Package Management |
| Python                   | Automation & Reporting        |
| Bash                     | Deployment Scripting          |

---

# CI/CD Pipeline Stages

| Stage                  | Description                                  |
| ---------------------- | -------------------------------------------- |
| CreateResources        | Creates Azure infrastructure using Terraform |
| BuildArtifact          | Generates application artifact               |
| BuildAndPushImage      | Builds Docker image and pushes to ACR        |
| ManualApproval         | Approval gate before deployment              |
| DeployWebAppContainer  | Deploys container image into Azure Web App   |
| DeployAKSOptional      | Optional Helm-based AKS deployment           |
| GenerateResourceReport | Generates Excel-based Azure inventory report |

---

# Dynamic Azure DevOps Pipeline

## Azure DevOps Pipeline Features

* Dynamic Terraform Output Variable Handling
* Multi-Environment Deployment
* Self-Hosted Agent Support
* Docker Build Automation
* Helm-Based AKS Deployment
* Automated Resource Inventory Reporting
* Manual Approval Gates
* Pipeline Artifact Publishing
* Dynamic Variable Validation
* Debug Logging and Validation Checks

---

# Docker Containerization

The application is fully containerized using Docker.

## Docker Workflow

```text
Application Source Code
        │
        ▼
Docker Build
        │
        ▼
Docker Image
        │
        ▼
Azure Container Registry (ACR)
        │
        ▼
Azure Web App / AKS
```

## Benefits of Containerization

* Environment consistency
* Faster deployments
* Scalability
* Isolation
* Portability
* Simplified rollback strategy

---

# Helm-Based AKS Deployment

This project optionally deploys the application into AKS using Helm Charts.

## Helm Advantages

* Simplified Kubernetes deployments
* Parameterized configuration
* Reusable deployment templates
* Easier upgrades and rollbacks
* Environment-specific configurations

## Helm Deployment Command

```bash
helm upgrade --install dragot-calculator \
  ./helm/dragot-calculator \
  --namespace calculator \
  --create-namespace
```

---

# Terraform Infrastructure

Terraform dynamically provisions:

| Azure Resource           | Purpose                 |
| ------------------------ | ----------------------- |
| Resource Group           | Resource Organization   |
| Azure Container Registry | Docker Image Repository |
| Azure Web App            | Application Hosting     |
| Azure Kubernetes Service | Kubernetes Hosting      |
| Virtual Network          | Network Isolation       |
| Subnets                  | Network Segmentation    |

---

# Dynamic Resource Inventory Reporting

At the end of the pipeline, a Python automation script generates:

* Azure Resource Inventory Excel Report
* Newly Created Resources Report
* Tagged Environment Details
* Build-Based Dynamic Reporting

## Generated Artifacts

| Artifact                           | Description                              |
| ---------------------------------- | ---------------------------------------- |
| `Resource_List_<env>_<build>.xlsx` | Complete Azure Resource Inventory        |
| `New_Resources_<env>_<build>.xlsx` | Newly Created Resources in Current Build |

---

# Expected Resource Report Output

| Resource Group    | Resource Name  | Resource Type                              | Location   | Environment |
| ----------------- | -------------- | ------------------------------------------ | ---------- | ----------- |
| RG_cal_ind_dev_06 | acrcalinddev06 | Microsoft.ContainerRegistry/registries     | southindia | dev         |
| RG_cal_ind_dev_06 | akscalinddev06 | Microsoft.ContainerService/managedClusters | southindia | dev         |
| RG_cal_ind_dev_06 | webcalinddev06 | Microsoft.Web/sites                        | southindia | dev         |

---

# Repository Structure

```text
DRAGOT_Git/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── dev.tfvars
│   ├── prod.tfvars
│
├── helm/
│   └── dragot-calculator/
│
├── scripts/
│   └── generate_resource_report.py
│
├── Dockerfile
│
├── azure-pipelines.yml
│
└── README.md
```

---

# Dynamic Pipeline Variables

Terraform outputs are dynamically exported into Azure DevOps pipeline variables:

```bash
echo "##vso[task.setvariable variable=acrName;isOutput=true]$ACR_NAME"
```

These variables are reused across:

* Docker Build Stage
* Web App Deployment
* AKS Deployment
* Resource Reporting

---

# Pipeline Validation Features

The pipeline includes:

* Variable validation
* Terraform validation
* Dynamic debugging logs
* Resource verification
* Build artifact publishing
* Deployment validation

---

# Sample Deployment Flow

```text
GitHub Commit
      │
      ▼
Azure DevOps Pipeline Trigger
      │
      ▼
Terraform Infrastructure Creation
      │
      ▼
Docker Image Build
      │
      ▼
Push Image to ACR
      │
      ▼
Manual Approval
      │
      ├── Deploy to Azure Web App
      │
      └── Optional Deploy to AKS using Helm
      │
      ▼
Generate Dynamic Resource Reports
```

---

# Key Features

* Enterprise CI/CD Design
* Fully Automated Infrastructure Provisioning
* Dynamic Multi-Environment Deployments
* Docker + Kubernetes Integration
* Helm-Based Kubernetes Deployments
* Automated Reporting
* Production-Style Azure DevOps Pipeline
* Terraform Output Variable Handling
* Artifact Publishing
* Resource Tagging Support

---

# Future Enhancements

* SonarQube Integration
* Security Scanning
* Terraform Remote Backend
* Azure Key Vault Integration
* Monitoring with Azure Monitor
* Prometheus & Grafana
* GitOps using ArgoCD
* Blue-Green Deployments

---

# Author

## DRAGOT – Azure DevOps Automation Project

Designed and implemented for enterprise-level Azure DevOps CI/CD automation and Kubernetes deployment workflows.
