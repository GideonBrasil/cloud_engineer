terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_azuread_application" "aks_sp_app" {
  name = "aks-sp-api"
}

resource "azurerm_azuread_service_principal" "aks_sp" {
  application_id = azurerm_azuread_application.aks_app.application_id
}

resource "azurerm_azuread_service_principal_password" "aks_sp_password" {
  service_principal_id = azurerm_azuread_service_principal.aks_sp.id
  value                = var.sp_password
  end_date             = "2024-03-20T00:00:000"
}

resource "azurerm_role_assignment" "sp_role_assignment" {
  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = azurerm_azuread_service_principal.aks_sp.id
}