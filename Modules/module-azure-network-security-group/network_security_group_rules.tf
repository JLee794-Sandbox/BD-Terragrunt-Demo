#
# Default Network Security Rules
#
resource "azurerm_network_security_rule" "network_security_rule_AllowGatewayManager" {
  name      = "AllowGatewayManager"
  priority  = "401"
  direction = "Inbound"
  access    = "Allow"
  protocol  = "*"

  source_port_range          = "*"
  source_address_prefix      = "GatewayManager"
  destination_port_range     = "65200-65535"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.network_security_group.name
}

resource "azurerm_network_security_rule" "network_security_rule_AllowAzureLoadBalancer" {
  name      = "AllowAzureLoadBalancer"
  priority  = "402"
  direction = "Inbound"
  access    = "Allow"
  protocol  = "*"

  source_port_range          = "*"
  source_address_prefix      = "AzureLoadBalancer"
  destination_port_range     = "*"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.network_security_group.name
}

resource "azurerm_network_security_rule" "network_security_rule_AllowVNetWebInbound" {
  name      = "AllowVNetWebInbound"
  priority  = "403"
  direction = "Inbound"
  access    = "Allow"
  protocol  = "*"

  source_port_range          = "*"
  source_address_prefix      = "VirtualNetwork"
  destination_port_range     = "*"
  destination_address_prefix = "VirtualNetwork"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.network_security_group.name
}

resource "azurerm_network_security_rule" "network_security_rule_DenyInternetInBound" {
  name      = "DenyInternetInBound"
  priority  = "4001"
  direction = "Inbound"
  access    = "Deny"
  protocol  = "*"

  source_port_range          = "*"
  source_address_prefix      = "Internet"
  destination_port_range     = "*"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.network_security_group.name
}
