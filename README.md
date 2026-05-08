# 🚀 DRAGOT Calculator [Web-App_DevOps_Project]

## 📌 Overview
This project is a simple **Python-based web calculator application** built using HTML, CSS, and JavaScript for the frontend, and Python for backend execution.  

The application is fully automated using **Azure DevOps CI/CD pipelines** and infrastructure is provisioned using **Terraform (Infrastructure as Code)** on Microsoft Azure.

---

## 🏗️ Architecture

The solution follows a modern DevOps architecture:

- **Frontend**: HTML, CSS, JavaScript (UI for calculator)
- **Backend**: Python (app.py)
- **Infrastructure**: Azure App Service + App Service Plan
- **IaC Tool**: Terraform
- **CI/CD Tool**: Azure DevOps Pipelines
- **Deployment Platform**: Azure Web App

### 📊 High-Level Flow
```
Developer → Azure Repos/GitHub → Azure Pipeline → Terraform (Infra Provisioning) → Azure Web App Deployment → Live Application
```

---

## 📁 Project Structure

```
C:.
│   app.py
│   azure-pipelines.yml
│   README.md
│   requirements.txt
│   startup.sh
│
├───app
│       index.html
│       script.js
│       style.css
│
└───terraform
        appservice-plan.tf
        outputs.tf
        provider.tf
        resource-group.tf
        terraform.tfvars
        variables.tf
        webapp.tf
```

---

## ⚙️ CI/CD Pipeline (Azure DevOps)

The pipeline is implemented using `azure-pipelines.yml` and includes the following stages:

### 🔹 1. Build Stage
- Install dependencies (`requirements.txt`)
- Validate Python application
- Package application artifacts

### 🔹 2. Infrastructure Provisioning (Terraform)
- `terraform init` → Initialize backend
- `terraform plan` → Preview infrastructure changes
- `terraform apply` → Provision Azure resources

### 🔹 3. Deployment Stage
- Deploy Python web application to **Azure App Service**
- Configure startup script (`startup.sh`)
- Publish static frontend files

---

## ☁️ Azure Resources Used

- Azure Resource Group
- Azure App Service Plan
- Azure Web App (Linux)
- (Optional) Azure Storage for state backend

---

## 🚀 Deployment Steps

### 1️⃣ Clone Repository
```bash
git clone https://github.com/Kureti-Venkat-Nishit-Pvt/DRAGOT_Git.git
cd C:\Users\Kureti Venkat Nishit\OneDrive\Documents\DRAGOT\Calculator\DRAGOT_Git
```

---

### 2️⃣ Configure Azure DevOps Pipeline
- Create a new pipeline in Azure DevOps
- Link repository (GitHub/Azure Repos) (Service Connection)
- Pipeline Link: https://dev.azure.com/Hexaware-Training/DRAGOT/_build?definitionId=27 
- Use `azure-pipelines.yml`

---

### 3️⃣ Run Pipeline
Pipeline will automatically:
- Provision infrastructure using Terraform
- Build application
- Deploy to Azure Web App

---

### 4️⃣ Access Application
After successful deployment:

```
https://webcalinddev02.azurewebsites.net/
```

---

## 🧰 Prerequisites

- Azure Subscription
- Azure DevOps Account
- Terraform installed (for local testing)
- Python 3.x
- Git

---

## 📌 Key Features

- Infrastructure as Code using Terraform
- Fully automated CI/CD pipeline
- Scalable Azure Web App deployment
- Lightweight calculator web UI
- Modular folder structure

---

## 📈 Future Enhancements

- Add Docker containerization
- Deploy on Azure Kubernetes Service (AKS)
- Add monitoring using Azure Application Insights
- Implement multi-environment pipelines (Dev/Stage/Prod)

---
