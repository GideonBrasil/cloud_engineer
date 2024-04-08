resource "azurerm_resource_group" "aks_resource_group" {
  name     = "${var.environment}-resource_group-${var.resource_group_name}"
  location = var.resource_group_location
}
resource "azurerm_management_lock" "resource-group-level" {
  name       = "resource-group-level"
  scope      = azurerm_resource_group.aks_resource_group.id
  lock_level = var.lock_level
  notes      = "This Resource Group is Read-Only"
}