# Terraform variables for the Required Azure resources in both development and production environments. Values are overridden in dev.tfvars and prod.tfvars files.

variable "subscription_id" {
  default     = "47e11824-86bc-41f8-9dbd-2816b994a6a2"
  description = "Azure Subscription ID where resources will be provisioned."
  type        = string
}

variable "location" {
  description = "The location of the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "web_app_name" {
  description = "The name of the Web App."
  type        = string
}

variable "acr_name" {
  description = "The name of the Container Registry."
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "aks_dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "container_image_repository" {
  type        = string
  description = "ACR repository name for the calculator image (tag managed by CI/CD)."
  default     = "dragot-calculator"
}

# =========================================================
# NEWLY ADDED
# Azure DevOps Pipeline Build ID
#
# This variable is passed dynamically from:
# azure-pipelines.yml
#
# Example:
# terraform apply -var="build_id=$(Build.BuildId)"
#
# This value is added as an Azure Resource Tag.
#
# Used later by:
# - Python reporting script
# - Excel inventory report
# - New vs Existing resource identification
# =========================================================
variable "build_id" {
  description = "Azure DevOps Pipeline Build ID"
  type        = string
  default     = ""
}

# =========================================================
# Common tags applied to all Azure resources
#
# These tags are merged with dynamic pipeline tags
# during Terraform deployment.
#
# Example:
# ENV
# CreatedByPipeline
# buildId
# =========================================================
variable "tags" {
  description = "Tags applied to all Azure resources"
  type        = map(string)
  default     = {}
}