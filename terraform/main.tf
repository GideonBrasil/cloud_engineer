module "aks" {
  for_each = toset(var.environment)
  source = "./modules/aks"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  environment = each.key
}