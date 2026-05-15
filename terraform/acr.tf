# Terraform configuration for Azure Container Registry (ACR)

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false

  tags = merge(
    var.tags,
    {
      ENV      = var.tags["ENV"]
      buildId  = var.build_id
    }
  )
}