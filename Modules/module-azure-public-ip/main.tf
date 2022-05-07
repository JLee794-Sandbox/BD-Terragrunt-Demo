resource "azurerm_public_ip" "public_ip" {
  name                = lower(join("", ["pip-", var.name]))
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
  ip_version          = var.ip_version
  domain_name_label   = var.domain_name_label
  availability_zone   = var.zones
  tags                = var.tags
}
