# Terraform configuration for Azure Resource Group (RG) creation.

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = merge(
    var.tags,
    {
      ENV      = var.tags["ENV"]
      buildId  = var.build_id
    }
  )
}