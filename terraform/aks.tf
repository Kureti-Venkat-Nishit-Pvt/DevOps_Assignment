# Terraform configuration for Azure Kubernetes Service (AKS) cluster

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_dns_prefix

  # Must match Azure: OIDC issuer cannot be disabled once enabled on the cluster.
  oidc_issuer_enabled = true

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  # Environment tags applied to AKS cluster.
  tags = var.tags
}