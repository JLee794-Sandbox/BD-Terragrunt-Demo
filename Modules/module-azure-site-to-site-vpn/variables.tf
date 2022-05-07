variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Virtual network location -	westeurope/eastus"
}

variable "name" {
  description = "Local network gateway name"
}

variable "local_network_gateway_address" {
  description = "Public IP address of the local network gateway"
}

variable "local_network_gateway_address_space" {
  description = "Address space of the local network gateway - 10.1.1.0/26"
}

variable "virtual_network_gateway_id" {
  description = "VPN Gateway ID"
}

variable "virtual_network_gateway_connection_type" {
  description = "VPN connection type"
  default     = "IPsec"
}

variable "virtual_network_gateway_pre_shared_key" {
  description = "Connection shared key secret name"
}

variable "tags" {
  description = "A mapping of tags to assign to resources"
  default     = {}
}
