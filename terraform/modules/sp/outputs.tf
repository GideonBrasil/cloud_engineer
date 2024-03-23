output "application_id" {
  value = azuread_application.cloud_engineer.application_id
}

output "service_principal_id" {
  value = azuread_service_principal.sp.id
}

output "service_principal_password" {
  value     = azuread_service_principal_password.sp_secret.value
  sensitive = true
}

output "tenant_id" {
  value = var.tenant_id
}