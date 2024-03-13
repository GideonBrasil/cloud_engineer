variable "sp_password" {
  description = "Service Principal password"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "The Subscription ID used for Azure resources"
  type        = string
}

variable "client_id" {
  description = "The Client ID of the Service Principal"
  type        = string
}

variable "environment" {
  description = "deployment environment ('dev' or 'prod')"
}