variable "subscription_id" {
  default    = "47e11824-86bc-41f8-9dbd-2816b994a6a2"
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

variable "tags" {
  type = map(string)
}