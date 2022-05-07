variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  default     = "eastus"
  description = "Resource group location"
}

variable "tags" {
  description = "A mapping of tags to assign to resource group"
  default     = {}
}

variable "name" {
  description = "Name of the Container Registry"
}

variable "sku" {
  default     = "Basic"
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium"
}

variable "admin_enabled" {
  type        = bool
  default     = null
  description = "Specifies whether the admin user is enabled"
}


variable "georeplication_locations" {
  default     = ["East US2"]
  description = "A list of Azure locations where the container registry should be geo-replicated."
}

variable "network_rule_set" {
  description = "(Optional) A network_rule_set block as documented below."
  type        = list
  default     = []
}
