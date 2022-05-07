resource "azurerm_public_ip" "public_ip" {
  name                = lower(join("", ["pip-", local.application_gateway_name]))
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  ip_version          = var.public_ip_ip_version
  domain_name_label   = local.application_gateway_name
  tags                = var.tags
}
