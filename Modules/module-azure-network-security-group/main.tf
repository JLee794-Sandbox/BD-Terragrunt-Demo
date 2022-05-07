resource "azurerm_network_security_group" "network_security_group" {
  name                = lower(format("%v", var.name))
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
