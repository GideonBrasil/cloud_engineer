variable "environment" {
  description = "deployment environment ('dev' or 'prod')"
  type = list(string)
}

variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

variable "resource_group_location" {
  description = "Resource group location"
  type = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Secret"
  type        = string
}