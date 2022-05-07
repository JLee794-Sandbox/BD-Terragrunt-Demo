variable "name" {
  description = "VPN Gateway name"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Virtual network location -	westeurope/eastus"
}

variable "subnet_name" {
  description = "Gateway subnet name"
  default     = "GatewaySubnet"
}

variable "public_ip_allocation_method" {
  description = "Public IP allocation method"
  default     = "Static"
}

variable "public_ip_sku" {
  description = "Public IP SKU"
  default     = "Standard"
}

variable "virtual_network_name" {
  description = "Virtual network name where Gateway subnet is created"
}

variable "address_prefixes" {
  description = "Gateway subnet address prefix - 10.0.1.0/27"
}

variable "virtual_network_gateway_type" {
  description = "Gateway type"
  default     = "Vpn"
}

variable "virtual_network_gateway_vpn_type" {
  description = "Gateway VPN type"
  default     = "RouteBased"
}

variable "virtual_network_gateway_active_active" {
  description = "Is Active-Active VPN"
  default     = false
}

variable "virtual_network_gateway_enable_bgp" {
  description = "Is BGP (Border Gateway Protocol) enabled for connection"
  default     = false
}

variable "virtual_network_gateway_sku" {
  description = "Gateway SKU"
  default     = "VpnGw3"
}

variable "virtual_network_gateway_private_ip_address_allocation" {
  description = "Private IP allocation method of gateway"
  default     = "Dynamic"
}

variable "tags" {
  description = "A mapping of tags to assign to resources"
  default     = {}
}
