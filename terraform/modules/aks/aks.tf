// is version check needed?

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-${var.environment}"
  location            = azurerm_resource_group.aks_resource_group.location
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  dns_prefix          = "poc-aks-${var.environment}"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}

resource "kubernetes_namespace" "aks_namespace" {
  metadata {
    name = var.environment
  }
}

resource "azurerm_role_assignment" "aks_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

resource "null_resource" "set_aks_github_secrets" {
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]

  triggers = {
    aks_cluster_name     = azurerm_kubernetes_cluster.aks_cluster.name
    resource_group_name  = azurerm_kubernetes_cluster.aks_cluster.resource_group_name
  }

  provisioner "local-exec" {
    command = "bash ../scripts/set_github_secrets.sh '${self.triggers.aks_cluster_name}' '${self.triggers.resource_group_name}'"
  }
}