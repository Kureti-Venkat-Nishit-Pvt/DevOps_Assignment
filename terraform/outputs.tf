output "webapp_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}