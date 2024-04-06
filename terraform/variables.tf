variable "environment" {
  description = "deployment environment ('dev' or 'prod')"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Resource group location"
  type        = string
}