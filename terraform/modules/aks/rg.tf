resource "azurerm_resource_group" "aks_resource_group" {
  name     = "${var.environment}-resource_group-${var.resource_group_name}"
  location = var.resource_group_location
}
