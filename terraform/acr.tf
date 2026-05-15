# Terraform configuration for Azure Container Registry (ACR)

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false

  # =========================================================
  # NEWLY UPDATED
  #
  # Added dynamic Azure DevOps Build ID tag.
  #
  # The Build ID is passed dynamically from:
  # azure-pipelines.yml
  #
  # terraform apply -var="build_id=$(Build.BuildId)"
  #
  # This is used for:
  # - Resource inventory tracking
  # - Excel report generation
  # - Identifying New vs Existing resources
  # =========================================================
  tags = merge(
    var.tags,
    {
      buildId = var.build_id
    }
  )
}