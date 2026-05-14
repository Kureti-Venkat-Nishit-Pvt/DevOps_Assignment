# =========================================================
# RESOURCE GROUP OUTPUTS
# =========================================================

output "resource_group_name" {

  description = "Azure Resource Group Name"

  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {

  description = "Azure Resource Group Location"

  value = azurerm_resource_group.rg.location
}

output "resource_group_id" {

  description = "Azure Resource Group ID"

  value = azurerm_resource_group.rg.id
}

# =========================================================
# APP SERVICE PLAN OUTPUTS
# =========================================================

output "app_service_plan_name" {

  description = "Azure App Service Plan Name"

  value = azurerm_service_plan.asp.name
}

output "app_service_plan_id" {

  description = "Azure App Service Plan ID"

  value = azurerm_service_plan.asp.id
}

output "app_service_plan_os_type" {

  description = "App Service Plan Operating System"

  value = azurerm_service_plan.asp.os_type
}

output "app_service_plan_sku" {

  description = "App Service Plan SKU"

  value = azurerm_service_plan.asp.sku_name
}

# =========================================================
# WEB APP OUTPUTS
# =========================================================

output "web_app_name" {

  description = "Azure Linux Web App Name"

  value = azurerm_linux_web_app.webapp.name
}

output "web_app_id" {

  description = "Azure Linux Web App ID"

  value = azurerm_linux_web_app.webapp.id
}

output "web_app_default_hostname" {

  description = "Azure Web App Default Hostname"

  value = azurerm_linux_web_app.webapp.default_hostname
}

output "web_app_url" {

  description = "Azure Web App URL"

  value = "https://${azurerm_linux_web_app.webapp.default_hostname}"
}

output "webapp_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}


output "web_app_outbound_ip_addresses" {

  description = "Outbound IP Addresses"

  value = azurerm_linux_web_app.webapp.outbound_ip_addresses
}

# =========================================================
# SUBSCRIPTION OUTPUTS
# =========================================================

output "subscription_id" {

  description = "Azure Subscription ID"

  value = var.subscription_id
}

# =========================================================
# ENVIRONMENT OUTPUTS
# =========================================================

output "environment_details" {

  description = "Environment Details"

  value = {
    resource_group = azurerm_resource_group.rg.name
    location       = azurerm_resource_group.rg.location
    app_service    = azurerm_service_plan.asp.name
    web_app        = azurerm_linux_web_app.webapp.name
    website_url    = "https://${azurerm_linux_web_app.webapp.default_hostname}"
  }
}

