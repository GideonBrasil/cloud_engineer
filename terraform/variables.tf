variable "sp_password" {
  description = "Service Principal password"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure resources Subscription ID"
  type        = string
}

variable "sp_client_id" {
  description = "Service Principal Client ID"
  type        = string
}

variable "sp_client_secret" {
  description = "Service Principal client Secret"
}

variable "environment" {
  description = "deployment environment ('dev' or 'prod')"
}