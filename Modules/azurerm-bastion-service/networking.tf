resource "azurerm_subnet" "azurebastionsubnet" {
  name                 = "AzureBastionSubnet"
  address_prefix       = var.address_prefix
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "bastion" {
  subnet_id                 = azurerm_subnet.azurebastionsubnet.id
  network_security_group_id = azurerm_network_security_group.bastionnsg.id
}

resource "azurerm_network_security_group" "bastionnsg" {
  name                = "bastionnsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "GatewayManager"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Internet-Bastion-PublicIP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "OutboundVirtualNetwork"
    priority                   = 1001
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22", "3389"]
    source_address_prefix      = "*"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "OutboundToAzureCloud"
    priority                   = 1002
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "AzureCloud"
  }
}

resource "azurerm_network_security_rule" "targetnsgbastionrule" {
  resource_group_name = var.resource_group_name

  name                        = "BastionTargetSubnetNSG_SSH"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["22", "3389"]
  source_address_prefix       = var.address_prefix
  destination_address_prefix  = "*"
  network_security_group_name = var.target_nsg_name
}
