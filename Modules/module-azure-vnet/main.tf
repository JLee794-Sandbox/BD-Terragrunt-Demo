resource "azurerm_virtual_network" "virtual_network" {
  name                = lower(join("", ["vnet-", var.name]))
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}



resource "azurerm_virtual_network_peering" "this" {
  count = var.target_vnet_id_for_peering == "" ? 0 : 1

  name                      = "${var.name}-peering-to-${element(split("/", var.target_vnet_id_for_peering), length(split("/", var.target_vnet_id_for_peering)) - 1)}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.virtual_network.name
  remote_virtual_network_id = var.target_vnet_id_for_peering
}
