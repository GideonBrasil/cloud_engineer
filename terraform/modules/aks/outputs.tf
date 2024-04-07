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

output "kube_admin_config" {
  description = <<EOT
A kube_admin_config block. This is only available when Role Based Access Control
with Azure Active Directory is enabled.
EOT
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config
}

output "kube_admin_config_raw" {
  description = <<EOT
Raw Kubernetes config for the admin account to be used by kubectl and other
compatible tools. This is only available when Role Based Access Control with
Azure Active Directory is enabled.
EOT
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config_raw
}
