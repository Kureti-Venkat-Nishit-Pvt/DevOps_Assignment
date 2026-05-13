# DRAGOT Calculator — DevOps (Mark_4)

## Overview

Python web calculator (HTML/CSS/JS frontend) with **Azure DevOps** CI/CD, **Terraform** on Azure, **Azure Container Registry (ACR)**, **Linux Web App** (container), and **optional AKS** deployment via **Helm**. Source repo is on **GitHub**; the pipeline YAML lives in this repo and is triggered on branch **`Cal_Mark_2`**.

## Architecture

| Layer | Technology |
|--------|------------|
| App | Python 3.11, `app.py`, `startup.sh` |
| Container | `Dockerfile`; image built with `az acr build` |
| Registry | Azure Container Registry |
| Web hosting | Azure Linux Web App — container image from ACR (managed identity + **AcrPull** RBAC) |
| Optional scale-out | Azure Kubernetes Service (AKS), Helm chart under `helm/dragot-calculator` |
| IaC | Terraform (`terraform/`) — resource group, ACR, AKS, App Service plan, Web App, RBAC |

High-level flow: **GitHub → Azure DevOps pipeline → Terraform (resources + RBAC) → build/publish artifact → ACR image → manual approval → Web App + optional AKS (Helm).**

## Pipeline stages (`azure-pipelines.yml`)

1. **CreateResources** — Terraform in separate **AzureCLI** tasks: init/validate, resource group, ACR, AKS, App Service + Web App, **ACR pull role assignments** (kubelet + Web App), final plan.
2. **BuildArtifact** — Zip repo and **PublishBuildArtifacts** (`drop`).
3. **BuildAndPushImage** — `az acr build` pushes `$(imageRepository):$(Build.BuildId)`.
4. **ManualApproval** — **ManualValidation@0** on server pool.
5. **DeployWebAppContainer** — Points Web App at the new image; enables **ACR managed identity** for pulls; sets `WEBSITES_PORT=8000`.
6. **DeployAKSOptional** — Runs if `deployToAks == true`: **Helm** `upgrade --install` using `helm/dragot-calculator` (namespace `calculator`).

**Agents (Objective 4):** This pipeline uses **Microsoft-hosted** agents (`vmImage: ubuntu-latest`). **Self-hosted agents are not used**; if you later need private network access or custom tooling, you could switch the VM pool to a self-hosted agent pool in Azure DevOps without changing the stage layout.

## Repository layout

```
azure-pipelines.yml
Dockerfile
app.py
startup.sh
requirements.txt
app/
helm/dragot-calculator/   # optional AKS deployment
terraform/
```

## Azure DevOps setup

1. **Pipeline** — New pipeline from GitHub, select repo/branch **`Cal_Mark_2`**, use existing YAML `azure-pipelines.yml`.
2. **Service connection** — ARM/Workload identity (e.g. `AzureSPN` as in YAML) with rights to create resources in the target subscription and assign RBAC (e.g. **Owner** or **Contributor** + **User Access Administrator** on the subscription or RG for role assignments).
3. **Variables** — Adjust `azureServiceConnection`, `resourceGroupName`, `webAppName`, `acrName`, `aksClusterName`, `imageRepository` to match your environment (aligned with `terraform/terraform.tfvars`).

## Terraform notes

- **Web App** is defined as a **Linux container** app pulling from ACR (`container_image_repository` variable, default `dragot-calculator`). Initial tag `latest` is a placeholder; CI/CD sets the running tag via Azure CLI.
- **AKS kubelet** and **Web App** identities receive **AcrPull** on the ACR scope (`terraform/acr-rbac.tf`).
- Provider: **azurerm** `~> 3.114` (see `terraform/versions.tf`).

## Local checks

```bash
cd terraform
terraform init
terraform validate
```

## Optional AKS access

After Helm deploy, get the service external IP:

```bash
kubectl get svc -n calculator
```

## Follow-ups

- Lock state backend (Azure Storage) for Terraform in team settings.
- Replace or secure secrets in `terraform.tfvars` (subscription ID); prefer pipeline/variable group or Key Vault references.
- Tune AKS node SKU/count and Web App SKU for cost.
