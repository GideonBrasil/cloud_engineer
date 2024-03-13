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
  name = "aks-sp-app"
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


resource "azurerm_container_registry" "acr" {
  name                = "acr${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = false
}

module "aks_development" {
  source = "./modules/aks"
  name   = "dev-aks-cluster"
  service_principal = {
    client_id     = var.sp_client_id
    client_secret = var.sp_client_secret
  }
  node_count  = 1
  environment = "development"
}

module "aks_production" {
  source = "./modules/aks"
  name   = "prod-aks-cluster"
  service_principal = {
    client_id     = var.sp_client_id
    client_secret = var.sp_client_secret
  }
  node_count  = 3
  environment = "production"
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = module.aks_development.service_principal_id
}