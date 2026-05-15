# Terraform outputs for the Azure resources provisioned by this configuration. 
# These outputs can be used in other Terraform configurations or 
# accessed after deployment to retrieve important information about the created resources.

# Resource Group output used by Azure DevOps pipeline stages.
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Azure Web App name output.
output "webapp_name" {
  value = azurerm_linux_web_app.webapp.name
}

# Azure Container Registry name output.
output "acr_name" {
  value = azurerm_container_registry.acr.name
}

# Azure Container Registry login server output.
# Used for Docker image push and deployments.
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

# AKS Cluster name output used during kubectl/helm deployment.
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

# Public Web App URL output.
output "webapp_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}