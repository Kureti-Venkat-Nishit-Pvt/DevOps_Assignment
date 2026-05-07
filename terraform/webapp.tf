resource "azurerm_linux_web_app" "webapp" {

  name                = var.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {

    application_stack {
      python_version = "3.11"
    }

    app_command_line = "bash startup.sh"
  }

  app_settings = {
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
    WEBSITES_PORT                  = "8000"
  }

  https_only = true
}