# Terraform configuration for Azure Resource Group (RG) creation. This RG will be used to group all related Azure resources for the DRAGOT Calculator application in both development and production environments. 
# The RG name and location are defined as variables, allowing for flexibility across different environments.

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  # Common tags shared across all Azure resources.
  # Values are supplied through environment-specific tfvars files.
  tags = var.tags
}