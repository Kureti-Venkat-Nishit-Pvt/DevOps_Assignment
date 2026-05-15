# Terraform variables for the development environment

resource_group_name = "RG_cal_ind_dev_06"

location = "South India"

app_service_plan_name = "ASP_cal_ind_dev_06"

web_app_name = "webcalinddev06"

acr_name = "acrcalinddev06"

aks_cluster_name = "aks-cal-ind-dev-06"

aks_dns_prefix = "aks-cal-ind-dev-06"

container_image_repository = "dragot-calculator"

tags = {
  ENV = "dev"
  CreatedByPipeline = "true"
}