# Terraform configuration for Azure Linux Web App.
# This Web App pulls Docker container images from Azure Container Registry (ACR).

resource "azurerm_linux_web_app" "webapp" {
  name                = var.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  # Enables Managed Identity authentication for secure Azure integrations.
  identity {
    type = "SystemAssigned"
  }

  site_config {

    # Docker container configuration.
    # The image repository is controlled through Terraform variables.
    application_stack {
      docker_image_name   = "${azurerm_container_registry.acr.login_server}/${var.container_image_repository}:latest"
      docker_registry_url = "https://${azurerm_container_registry.acr.login_server}"
    }

    # Uses Managed Identity instead of username/password authentication.
    container_registry_use_managed_identity = true
  }

  # Application runtime settings.
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    WEBSITES_PORT                       = "8000"
  }

  https_only = true

  # =========================================================
  # NEWLY UPDATED
  #
  # Added dynamic Azure DevOps Pipeline Build ID tag.
  #
  # Used by:
  # - Resource inventory report
  # - Excel report highlighting
  # - Tracking pipeline-created resources
  # =========================================================
  tags = merge(
    var.tags,
    {
      buildId = var.build_id
    }
  )
}