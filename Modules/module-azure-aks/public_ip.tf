locals {
  outbound_public_ip_name = lower(join("", ["pip-aks-out-", format("%v", var.name)]))
}

resource "azurerm_public_ip" "outbound_public_ip" {
  name                = local.outbound_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
  domain_name_label   = local.outbound_public_ip_name
  tags                = var.tags
}
