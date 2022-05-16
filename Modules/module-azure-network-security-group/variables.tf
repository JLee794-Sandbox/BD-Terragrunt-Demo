variable "name" {
  description = "Network Security Group name"
}

variable "location" {
  description = "Network Security Group location"
}

variable "resource_group_name" {
  description = "Network Security Group resource group name"
}

variable "tags" {
  type = map
  description = "A mapping of tags to assign"
  default     = {}
}
