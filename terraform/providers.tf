terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}

provider "azurerm" {
  features {}

  # subscription_id   = "<azure_subscription_id>"
  # tenant_id         = "<azure_subscription_tenant_id>"
  # client_id         = "<service_principal_appid>"
  # client_secret     = "<service_principal_password>"
}

provider "azuread" {}