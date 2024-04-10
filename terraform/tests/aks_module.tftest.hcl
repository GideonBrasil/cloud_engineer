provider "azurerm" {
  features {}
}

variables {
  environment             = "dev"
  resource_group_name     = "myaks"
  resource_group_location = "canadacentral"
  lock_level              = "ReadOnly"
  acr_lock_level          = "CanNotDelete"
}

run "resource_group_name_validations" {
  command = plan

  assert {
    condition     = module.aks.resource_group_name == "dev-resource_group-myaks"
    error_message = "Resource Group location does not match expected rg name."
  }
}

run "aks_cluster_name_validation" {
  command = plan

  assert {
    condition     = module.aks.aks_cluster_name == "aks-${var.environment}"
    error_message = "AKS cluster name was not found."
  }
}

// run "resource_group_name_e2e" {
//   command = apply

//   assert {
//     condition = module.aks.aks_cluster_name == "aks-${var.environment}"
//     error_message = "AKS cluster name was not found."
//   }
// }