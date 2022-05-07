resource "azurerm_subnet" "gateway_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "gateway_public_ip" {
  name                = lower(join("", ["pip-vgw-", var.name]))
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name                = lower(join("", ["vgw-", var.name]))
  location            = var.location
  resource_group_name = var.resource_group_name

  type     = var.virtual_network_gateway_type
  vpn_type = var.virtual_network_gateway_vpn_type

  active_active = var.virtual_network_gateway_active_active
  enable_bgp    = var.virtual_network_gateway_enable_bgp
  sku           = var.virtual_network_gateway_sku

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.gateway_public_ip.id
    private_ip_address_allocation = var.virtual_network_gateway_private_ip_address_allocation
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }

  tags = var.tags
}
