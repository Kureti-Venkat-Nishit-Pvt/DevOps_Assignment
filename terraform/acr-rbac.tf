# Terraform configuration for Azure Container Registry (ACR) Role-Based Access Control (RBAC) assignments

# Allows AKS kubelet identity to pull images from ACR.
# This is required for Kubernetes pods to access container images stored in Azure Container Registry.
resource "azurerm_role_assignment" "aks_kubelet_acr_pull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}

# Allows Azure Web App managed identity to pull images from ACR.
# This enables secure authentication without storing credentials.
resource "azurerm_role_assignment" "webapp_acr_pull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_linux_web_app.webapp.identity[0].principal_id
  skip_service_principal_aad_check = true
}