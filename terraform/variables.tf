variable "subscription_id" {}
variable "location" {}
variable "resource_group_name" {}
variable "app_service_plan_name" {}
variable "web_app_name" {}
variable "acr_name" {}
variable "aks_cluster_name" {}
variable "aks_dns_prefix" {}

variable "container_image_repository" {
  type        = string
  description = "ACR repository name for the calculator image (tag managed by CI/CD)."
  default     = "dragot-calculator"
}