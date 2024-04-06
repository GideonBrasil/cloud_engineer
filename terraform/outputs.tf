output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

output "kube_admin_config_raw" {
  value = module.aks.kube_config_raw
  sensitive = true
}