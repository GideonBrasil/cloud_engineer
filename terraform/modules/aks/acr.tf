resource "azurerm_container_registry" "acr" {
  name                = "wellsperformanceacr${var.environment}"
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  location            = azurerm_resource_group.aks_resource_group.location
  sku                 = "Standard"
  admin_enabled       = false
}