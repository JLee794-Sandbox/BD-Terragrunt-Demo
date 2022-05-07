variable "enabled" {
  default     = true
  description = "If module enabled"
}

variable "vpn_virtual_network_name" {
  description = "VPN Gateway virtual network name"
}

variable "vpn_virtual_network_resource_group_name" {
  description = "VPN Gateway virtual network resource group name"
}

variable "environment_virtual_network_resource_group_name" {
  description = "Environment virtual network resource group name"
}

variable "environment_virtual_network_name" {
  description = "Environment virtual network name"
}
