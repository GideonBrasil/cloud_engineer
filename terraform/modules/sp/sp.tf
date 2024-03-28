resource "azuread_application" "cloud_engineer" {
  display_name = "cloud_engineer-app"
}

resource "azuread_service_principal" "sp" {
  application_id = azuread_application.cloud_engineer.application_id
}

resource "azuread_service_principal_password" "sp_secret" {
  service_principal_id = azuread_service_principal.sp.id
  end_date             = "2024-04-30T00:00:00Z"
}

resource "azurerm_role_assignment" "sp_role" {
  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.sp.id
}

# resource "null_resource" "github_secrets" {
#   triggers = {
#     application_id = azuread_application.cloud_engineer.application_id
#   }

#   provisioner "local-exec" {
#     command = "bash ../scripts/set_github_secrets.sh ${azuread_application.cloud_engineer.application_id} '${azuread_service_principal_password.sp_secret.value}' ${var.tenant_id}"
#   }
# }