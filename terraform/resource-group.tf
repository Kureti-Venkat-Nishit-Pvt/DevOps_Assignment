# Terraform configuration for Azure Resource Group (RG) creation. This RG will be used to group all related Azure resources for the DRAGOT Calculator application in both development and production environments. 
# The RG name and location are defined as variables, allowing for flexibility across different environments.

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  # =========================================================
  # NEWLY UPDATED
  #
  # Merges:
  # - Static environment tags from tfvars
  # - Dynamic Azure DevOps Pipeline Build ID
  #
  # This enables:
  # - Resource inventory tracking
  # - Excel report highlighting
  # - New vs Existing resource detection
  #
  # Example final Azure tags:
  #
  # env               = dev
  # CreatedByPipeline = true
  # buildId           = 20260515
  # =========================================================
  tags = merge(
    var.tags,
    {
      buildId = var.build_id
    }
  )
}