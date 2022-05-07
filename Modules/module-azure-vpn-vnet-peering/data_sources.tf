data "azurerm_virtual_network" "environment_virtual_network" {
  name                = var.environment_virtual_network_name
  resource_group_name = var.environment_virtual_network_resource_group_name
}

data "azurerm_virtual_network" "vpn_virtual_network" {
  name                = var.vpn_virtual_network_name
  resource_group_name = var.vpn_virtual_network_resource_group_name
}
