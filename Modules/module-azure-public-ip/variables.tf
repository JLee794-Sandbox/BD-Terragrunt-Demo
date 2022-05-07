variable "name" {
  description = "Public IP name"
}

variable "location" {
  description = "Public IP location"
}

variable "resource_group_name" {
  description = "Public IP resource group name"
}

variable "allocation_method" {
  default     = "Static"
  description = "Public Ip allocation method - Static/Dynamic"
}

variable "sku" {
  default     = "Standard"
  description = "The SKU of the Public IP - Basic/Standard"
}

variable "ip_version" {
  default     = "IPv4"
  description = "The IP Version to use - IPv4/IPv6"
}

variable "zones" {
  default     = "Zone-Redundant"
  description = "A collection containing the availability zone to allocate the Public IP in"
}

variable "domain_name_label" {
  description = "Public Ip FQDN"
}

variable "tags" {
  description = "A mapping of tags to assign"
  default     = {}
}
