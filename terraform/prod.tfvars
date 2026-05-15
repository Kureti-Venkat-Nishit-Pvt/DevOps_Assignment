# Terraform variables for the production environment

resource_group_name = "RG_cal_ind_prod_06"

location = "South India"

app_service_plan_name = "ASP_cal_ind_prod_06"

web_app_name = "webcalindprod06"

acr_name = "acrcalindprod06"

aks_cluster_name = "aks-cal-ind-prod-06"

aks_dns_prefix = "aks-cal-ind-prod-06"

container_image_repository = "dragot-calculator"

# =========================================================
# Common tags applied to all Azure resources
#
# NEWLY UPDATED:
# ENV key converted to lowercase "env"
#
# Required for:
# - Azure Resource Inventory Reporting
# - Excel Report Generation
# - Pipeline Resource Tracking
# =========================================================
tags = {
  env               = "prod"
  CreatedByPipeline = "true"
}