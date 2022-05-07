variable "resource_group_name" {
  description = "Resource group name"
}

variable "name" {
  default     = ""
  description = "Name of the user assigned identity"
}

variable "location" {
  default     = "eastus"
  description = "User assigned identity resource location"
}

variable "tags" {
  description = "A mapping of tags to assign to the user identity"
  default     = {}
}

variable "subscription_id" {
  description = "Subscription id"
  default     = ""
}

variable "tenant_id" {
  description = "Tenant id"
  default     = ""
}

variable "aks_node_resource_group" {
  description = "Name of the resource group where the kubernetes nodes should exist"
  default     = ""
}

variable "key_vault_id" {
  description = "ID of the key vault"
  default     = ""
}
