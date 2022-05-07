resource "azurerm_network_security_rule" "network_security_rule_AllowGatewayInternet" {
  name      = "AllowGatewayInternet"
  priority  = "502"
  direction = "Inbound"
  access    = "Allow"
  protocol  = "*"

  source_port_range          = "*"
  source_address_prefix      = "Internet"
  destination_port_range     = "65200-65535"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = var.gateway_ip_configuration_network_security_group_name
}

resource "azurerm_network_security_rule" "network_security_rule_AllowHTTPSInternet" {
  name      = "AllowHTTPSInternet"
  priority  = "503"
  direction = "Inbound"
  access    = "Allow"
  protocol  = "*"

  source_port_range          = "*"
  source_address_prefixes    = split(",", (join(",", [var.inbound_whitelist_ips, azurerm_public_ip.public_ip.ip_address])))
  destination_port_range     = "443"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = var.gateway_ip_configuration_network_security_group_name

  depends_on = [azurerm_public_ip.public_ip]
}
