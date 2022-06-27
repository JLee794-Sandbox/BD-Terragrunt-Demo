resource "azurerm_private_dns_zone" "private_dns_zone" {
  count = var.public_domain_name == "" ? 0 : 1

  name                = var.private_domain_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_link" {
  count = var.public_domain_name == "" ? 0 : 1

  name                  = "vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.0.name
  virtual_network_id    = azurerm_virtual_network.virtual_network.id
  registration_enabled  = var.registration_enabled
  tags                  = var.tags
}

resource "azurerm_dns_zone" "dns_zone" {
  count = var.public_domain_name == "" ? 0 : 1

  name                = var.public_domain_name
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_dns_a_record" "dns_record" {
  count = var.public_domain_name == "" ? 0 : 1

  name                = var.public_domain_record_name
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = var.records
}
