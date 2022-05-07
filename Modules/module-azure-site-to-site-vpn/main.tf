resource "azurerm_local_network_gateway" "local_network_gateway" {
  name                = lower(join("", ["lgw-", var.name]))
  location            = var.location
  resource_group_name = var.resource_group_name
  gateway_address     = var.local_network_gateway_address
  address_space       = split(",", var.local_network_gateway_address_space)
  tags                = var.tags
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection" {
  name                = lower(join("", ["cn-", var.name]))
  location            = var.location
  resource_group_name = var.resource_group_name

  type                       = var.virtual_network_gateway_connection_type
  virtual_network_gateway_id = var.virtual_network_gateway_id
  local_network_gateway_id   = azurerm_local_network_gateway.local_network_gateway.id

  shared_key = var.virtual_network_gateway_pre_shared_key

  tags = var.tags
}
