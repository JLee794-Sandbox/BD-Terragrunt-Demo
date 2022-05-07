resource "azurerm_subnet" "subnet_delegation" {
  count                = var.create_function ? 1 : 0
  name                 = lower(join("", ["sneti-func-", var.name]))
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.address_prefixes]
  service_endpoints    = var.service_endpoints


  delegation {
    name = join("-", ["delegation", var.delegation_prefix])
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  count                     = var.create_function ? 1 : 0
  subnet_id                 = azurerm_subnet.subnet_delegation[0].id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration_functions" {
  count          = var.create_function ? 1 : 0
  app_service_id = azurerm_function_app.function_app[0].id
  subnet_id      = azurerm_subnet.subnet_delegation[0].id
  depends_on     = [azurerm_function_app.function_app]
}
