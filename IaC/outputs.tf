output "service_principal_application_id" {
  value = azurerm_azuread_application.aks_sp.application_id
}

output "service_principal_password" {
  value     = azurerm_azuread_service_principal_password.aks_sp_password.value
  sensitive = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}