# 🚀 DRAGOT – End-to-End Azure DevOps CI/CD Project  
---
---

[![Pipeline Status](https://img.shields.io/badge/Azure%20Pipeline-DRAGOT-success?style=for-the-badge&logo=azuredevops)](https://dev.azure.com/YOUR_ORG/YOUR_PROJECT/_build)

---

[![GitHub Repo](https://img.shields.io/badge/GitHub-Repository-black?style=for-the-badge&logo=github)](https://github.com/Kureti-Venkat-Nishit-Pvt/DRAGOT_Git)
![Branch](https://img.shields.io/badge/Current%20Branch-Mark__6-green?style=for-the-badge&logo=github)

---

![Azure DevOps](https://img.shields.io/badge/Azure%20DevOps-CI%2FCD-blue?style=for-the-badge&logo=azuredevops)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-AKS-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Python](https://img.shields.io/badge/Python-Automation-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Helm](https://img.shields.io/badge/Helm-Charts-0F1689?style=for-the-badge&logo=helm&logoColor=white)

---
---

# 🌟 Project Overview

DRAGOT is a complete **Enterprise-Style Azure DevOps CI/CD Implementation** built using modern DevOps and Cloud-Native technologies.

This project demonstrates how to automate the complete lifecycle of a cloud-native application deployment using:

- ⚙️ Infrastructure as Code (Terraform)
- 🔄 CI/CD Automation (Azure DevOps)
- 🐳 Docker Containerization
- ☸️ Kubernetes Orchestration
- 📦 Helm Deployments
- ☁️ Azure Cloud Services
- 📊 Dynamic Resource Reporting

---

# 🏗️ Technologies Used

| Technology | Purpose |
|------------|---------|
| ![Azure DevOps](https://img.shields.io/badge/Azure%20DevOps-blue?logo=azuredevops&style=flat-square) | CI/CD Pipeline |
| ![GitHub](https://img.shields.io/badge/GitHub-black?logo=github&style=flat-square) | Source Code Repository |
| ![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&style=flat-square) | Infrastructure Provisioning |
| ![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&style=flat-square) | Containerization |
| ![Azure](https://img.shields.io/badge/Azure%20Container%20Registry-0078D4?logo=microsoftazure&style=flat-square) | Image Storage |
| ![Azure](https://img.shields.io/badge/Azure%20Web%20App-0078D4?logo=microsoftazure&style=flat-square) | Application Hosting |
| ![Kubernetes](https://img.shields.io/badge/Azure%20Kubernetes%20Service-326CE5?logo=kubernetes&style=flat-square) | Kubernetes Hosting |
| ![Helm](https://img.shields.io/badge/Helm-0F1689?logo=helm&style=flat-square) | Kubernetes Package Management |
| ![Python](https://img.shields.io/badge/Python-3776AB?logo=python&style=flat-square) | Automation & Reporting |
| ![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&style=flat-square) | Deployment Scripting |

---

# 🏛️ Project Architecture

```text
👨‍💻 Developer Commit
        │
        ▼
📂 GitHub Repository
        │
        ▼
🚀 Azure DevOps Pipeline
        │
        ├── ⚙️ Terraform Infrastructure Provisioning
        │
        ├── 🐳 Docker Image Build
        │
        ├── 📦 Push Image to Azure Container Registry (ACR)
        │
        ├── ✅ Manual Approval Stage
        │
        ├── 🌐 Deploy to Azure Web App
        │
        └── ☸️ Optional AKS Deployment using Helm
````

---

# 🎯 Objectives

✅ Create an end-to-end DevOps setup using Azure DevOps and GitHub
✅ Provision Azure infrastructure using Terraform
✅ Build and deploy containerized applications
✅ Use Self-Hosted Agents for CI/CD execution
✅ Deploy applications into Azure Web App and AKS
✅ Automate infrastructure provisioning and deployment
✅ Generate dynamic Azure resource inventory reports

---

# 🌍 Environments

| Environment | Purpose               | TFVars File   |
| ----------- | --------------------- | ------------- |
| 🧪 Dev      | Development & Testing | `dev.tfvars`  |
| 🚀 Prod     | Production Deployment | `prod.tfvars` |

The environment is selected dynamically using Azure DevOps pipeline parameters.

---

# 🔄 CI/CD Pipeline Stages

| Stage                     | Description                                  |
| ------------------------- | -------------------------------------------- |
| ⚙️ CreateResources        | Creates Azure infrastructure using Terraform |
| 📦 BuildArtifact          | Generates application artifact               |
| 🐳 BuildAndPushImage      | Builds Docker image and pushes to ACR        |
| ✅ ManualApproval          | Approval gate before deployment              |
| 🌐 DeployWebAppContainer  | Deploys container image into Azure Web App   |
| ☸️ DeployAKSOptional      | Optional Helm-based AKS deployment           |
| 📊 GenerateResourceReport | Generates Azure inventory reports            |

---

# 🚀 Dynamic Azure DevOps Pipeline

## ✨ Pipeline Features

* 🔄 Dynamic Terraform Output Variable Handling
* 🌍 Multi-Environment Deployment
* 🖥️ Self-Hosted Agent Support
* 🐳 Docker Build Automation
* ☸️ Helm-Based AKS Deployment
* 📊 Automated Resource Inventory Reporting
* ✅ Manual Approval Gates
* 📦 Pipeline Artifact Publishing
* 🔍 Dynamic Variable Validation
* 🛠️ Debug Logging & Validation Checks

---

# 🐳 Docker Containerization

The application is fully containerized using Docker.

## 🔁 Docker Workflow

```text
📦 Application Source Code
          │
          ▼
🐳 Docker Build
          │
          ▼
📦 Docker Image
          │
          ▼
☁️ Azure Container Registry (ACR)
          │
          ▼
🌐 Azure Web App / ☸️ AKS
```

## 🌟 Benefits of Containerization

* ✅ Environment Consistency
* ⚡ Faster Deployments
* 📈 Scalability
* 🔒 Isolation
* 🌍 Portability
* 🔁 Simplified Rollbacks

---

# ☸️ Helm-Based AKS Deployment

This project optionally deploys the application into AKS using Helm Charts.

## 🚀 Helm Advantages

* 📦 Simplified Kubernetes Deployments
* ⚙️ Parameterized Configuration
* ♻️ Reusable Deployment Templates
* 🔄 Easier Upgrades & Rollbacks
* 🌍 Environment-Specific Configurations

## 🧾 Helm Deployment Command

```bash
helm upgrade --install dragot-calculator \
  ./helm/dragot-calculator \
  --namespace calculator \
  --create-namespace
```

---

# ⚙️ Terraform Infrastructure

Terraform dynamically provisions:

| Azure Resource              | Purpose                 |
| --------------------------- | ----------------------- |
| 📁 Resource Group           | Resource Organization   |
| 📦 Azure Container Registry | Docker Image Repository |
| 🌐 Azure Web App            | Application Hosting     |
| ☸️ Azure Kubernetes Service | Kubernetes Hosting      |
| 🌐 Virtual Network          | Network Isolation       |
| 🔀 Subnets                  | Network Segmentation    |

---

# 📊 Dynamic Resource Inventory Reporting

At the end of the pipeline, a Python automation script generates:

* 📄 Azure Resource Inventory Excel Report
* 🆕 Newly Created Resources Report
* 🏷️ Tagged Environment Details
* 🔢 Build-Based Dynamic Reporting

## 📦 Generated Artifacts

| Artifact                           | Description                              |
| ---------------------------------- | ---------------------------------------- |
| `Resource_List_<env>_<build>.xlsx` | Complete Azure Resource Inventory        |
| `New_Resources_<env>_<build>.xlsx` | Newly Created Resources in Current Build |

---

# 📋 Expected Resource Report Output

| Resource Group    | Resource Name  | Resource Type                              | Location   | Environment |
| ----------------- | -------------- | ------------------------------------------ | ---------- | ----------- |
| RG_cal_ind_dev_06 | acrcalinddev06 | Microsoft.ContainerRegistry/registries     | southindia | dev         |
| RG_cal_ind_dev_06 | akscalinddev06 | Microsoft.ContainerService/managedClusters | southindia | dev         |
| RG_cal_ind_dev_06 | webcalinddev06 | Microsoft.Web/sites                        | southindia | dev         |

---

# 📁 Repository Structure

```text
🚀 DRAGOT_Git
│
├── 📁 app
│   ├── 🌐 index.html
│   ├── 📜 scripts.js
│   └── 🎨 style.css
│
├── 📁 terraform
│   ├── ⚙️ main.tf
│   ├── ⚙️ variables.tf
│   ├── 🔧 dev.tfvars
│   └── 🔧 prod.tfvars
│
├── 📁 helm
│   └── 📁 dragot-calculator
│       ├── 📦 Chart.yaml
│       └── ⚙️ values.yaml
│
├── 📁 scripts
│   └── 🐍 generate_resource_report.py
│
├── 📁 terraform
│   ├── 🔐 acr-rbac.tf
│   ├── 📦 acr.tf
│   ├── ☸️ aks.tf
│   ├── 🖥️ appservice-plan.tf
│   ├── 🔧 dev.tfvars
│   ├── 📤 outputs.tf
│   ├── 🔧 prod.tfvars
│   ├── 🌐 provider.tf
│   ├── 📁 resource-group.tf
│   ├── ⚙️ variables.tf
│   └── 🌍 webapp.tf
│
├── 🚫 .dockerignore
├── 🐍 app.py
├── 🐳 Dockerfile
├── 🔄 azure-pipelines.yml
├── 🚀 startup.sh
└── 📘 README.md

```

---

# 🔧 Dynamic Pipeline Variables

Terraform outputs are dynamically exported into Azure DevOps pipeline variables:

```bash
echo "##vso[task.setvariable variable=acrName;isOutput=true]$ACR_NAME"
```

These variables are reused across:

* 🐳 Docker Build Stage
* 🌐 Web App Deployment
* ☸️ AKS Deployment
* 📊 Resource Reporting

---

# 🛡️ Pipeline Validation Features

The pipeline includes:

* ✅ Variable Validation
* ✅ Terraform Validation
* ✅ Dynamic Debugging Logs
* ✅ Resource Verification
* ✅ Artifact Publishing
* ✅ Deployment Validation

---

# 🚀 Sample Deployment Flow

```text
📂 GitHub Commit
        │
        ▼
🚀 Azure DevOps Pipeline Trigger
        │
        ▼
⚙️ Terraform Infrastructure Creation
        │
        ▼
🐳 Docker Image Build
        │
        ▼
📦 Push Image to ACR
        │
        ▼
✅ Manual Approval
        │
        ├── 🌐 Deploy to Azure Web App
        │
        └── ☸️ Optional Deploy to AKS using Helm
        │
        ▼
📊 Generate Dynamic Resource Reports
```

---

# 🌟 Key Features

* 🏢 Enterprise CI/CD Design
* ⚙️ Fully Automated Infrastructure Provisioning
* 🌍 Dynamic Multi-Environment Deployments
* 🐳 Docker + Kubernetes Integration
* ☸️ Helm-Based Kubernetes Deployments
* 📊 Automated Reporting
* 🚀 Production-Style Azure DevOps Pipeline
* 🔄 Terraform Output Variable Handling
* 📦 Artifact Publishing
* 🏷️ Resource Tagging Support

---

# 🔮 Future Enhancements

* 🔍 SonarQube Integration
* 🔐 Security Scanning
* ☁️ Terraform Remote Backend
* 🔑 Azure Key Vault Integration
* 📈 Azure Monitor Integration
* 📊 Prometheus & Grafana
* 🚀 GitOps using ArgoCD
* 🔄 Blue-Green Deployments

---

# 👨‍💻 Author

## 🚀 DRAGOT – Azure DevOps Automation Project

Designed and implemented for enterprise-level Azure DevOps CI/CD automation, Infrastructure as Code, containerization, and Kubernetes deployment workflows.

---

# ⭐ Support

If you found this project useful:

🌟 Star the Repository
🍴 Fork the Project
🚀 Follow for more Azure DevOps & Cloud Projects


---