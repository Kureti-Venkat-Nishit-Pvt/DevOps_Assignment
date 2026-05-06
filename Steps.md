# AKS Provisioning via Azure DevOps Pipeline and Terraform

Last updated: 06-05-2026

This repository provisions an Azure Resource Group and an Azure Kubernetes Service (AKS) cluster using:
- Azure DevOps Pipelines with a Service Connection to an existing Pay-As-You-Go subscription
- Terraform with a remote backend stored in Azure Storage (bootstrapped by the pipeline)

No new Azure subscription is created. The pipeline targets your existing Pay-As-You-Go subscription selected in the Service Connection.

## What this deploys

- Remote Terraform state backend on Azure Storage (Resource Group, Storage Account, Container)
- Resource Group for AKS
- AKS cluster with a system-assigned managed identity and RBAC enabled

## Prerequisites

- Existing Azure subscription: Pay-As-You-Go (with Contributor access for your Service Principal).
- Azure DevOps organization and project.
- Repository in Azure Repos or GitHub containing this code and pipeline YAML.
- Azure CLI locally (optional, for validation only).
- kubectl locally (optional, for validation only).

## Azure DevOps Service Connection

1. In Azure DevOps, go to: Project Settings > Service connections > New service connection.
2. Choose "Azure Resource Manager" > "Service principal (automatic)".
3. Scope Level: Subscription.
4. Select your existing Pay-As-You-Go subscription (do not create a new subscription).
5. Check "Grant access permission to all pipelines".
6. Name it, e.g., `sc-azure-rm`.

## Repository Structure
