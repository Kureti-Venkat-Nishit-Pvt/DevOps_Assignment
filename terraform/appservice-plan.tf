# Terraform configuration for Azure App Service Plan (ASP)

resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  os_type  = "Linux"
  sku_name = "B1"

  # =========================================================
  # NEWLY UPDATED
  #
  # Added Azure DevOps Pipeline Build ID
  # as a dynamic Azure Resource Tag.
  #
  # Helps identify resources created
  # during the current pipeline execution.
  # =========================================================
  tags = merge(
    var.tags,
    {
      buildId = var.build_id
    }
  )
}