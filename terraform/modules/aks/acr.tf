resource "azurerm_container_registry" "acr" {
  name                = "wellsperformanceacr${var.environment}"
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  location            = azurerm_resource_group.aks_resource_group.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_management_lock" "container-registry-level" {
  name       = "container-registry-level"
  scope      = azurerm_container_registry.acr.id
  lock_level = var.acr_lock_level
  notes      = "Locked for accidental deletion of Azure Container Registry"
}