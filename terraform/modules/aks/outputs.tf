output "resource_group_id" {
  value = azurerm_resource_group.aks_resource_group.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "resource_group_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.resource_group_name
}

output "kube_config_raw" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config
  sensitive = true
}