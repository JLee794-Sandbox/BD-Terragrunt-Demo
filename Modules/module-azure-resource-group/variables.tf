variable "name" {
  description = "Resource group name"
}

variable "location" {
  default     = "eastus"
  description = "Resource group location"
}

variable "tags" {
  description = "A mapping of tags to assign to resource group"
  type        = map(string)
  default     = {}
}
