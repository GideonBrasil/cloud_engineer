output "resource_group_id" {
  value = azurerm_resource_group.aks_resource_group.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}