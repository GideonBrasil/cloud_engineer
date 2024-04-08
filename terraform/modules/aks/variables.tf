variable "environment" {
  description = "deployment environment ('dev' or 'prod')"
  type = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

variable "resource_group_location" {
  description = "Resource group location"
  type = string
}

variable "lock_level" {
  description = "Default lock level"
  default = "ReadOnly"
  type = string
}

variable "acr_lock_level" {
    description = "ACR lock level"
  default = "CanNotDelete"
  type = string
}