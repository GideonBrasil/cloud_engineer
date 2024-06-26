terraform {
  backend "azurerm" {
    resource_group_name  = "pocTerraformStateRG"
    storage_account_name = "pocstatewellsperformance"
    container_name       = "poctfstate"
    key                  = "env-dev/terraform.tfstate"
    use_oidc             = true
  }
}