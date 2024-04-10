output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "resource_group_name" {
  value = module.aks.resource_group_name
}

output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "kube_config_raw" {
  value     = module.aks.kube_config_raw
  sensitive = true
}