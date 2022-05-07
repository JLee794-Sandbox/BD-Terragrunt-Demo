resource "azurerm_virtual_network_peering" "virtual_network_peering_to_hub" {
  count                        = var.enabled ? 1 : 0
  name                         = lower(join("", ["peer-", var.environment_virtual_network_name, "-to-", var.vpn_virtual_network_name]))
  resource_group_name          = var.environment_virtual_network_resource_group_name
  virtual_network_name         = var.environment_virtual_network_name
  remote_virtual_network_id    = data.azurerm_virtual_network.vpn_virtual_network.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = true
}

resource "azurerm_virtual_network_peering" "virtual_network_peering_to_spoke" {
  count                        = var.enabled ? 1 : 0
  name                         = lower(join("", ["peer-", var.vpn_virtual_network_name, "-to-", var.environment_virtual_network_name]))
  resource_group_name          = var.vpn_virtual_network_resource_group_name
  virtual_network_name         = var.vpn_virtual_network_name
  remote_virtual_network_id    = data.azurerm_virtual_network.environment_virtual_network.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = true
  use_remote_gateways          = false
}
