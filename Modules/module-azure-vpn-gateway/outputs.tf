output "resource_group_name" {
  value = azurerm_virtual_network_gateway.virtual_network_gateway.resource_group_name
}

output "location" {
  value = azurerm_virtual_network_gateway.virtual_network_gateway.location
}

output "gateway_subnet_id" {
  value = azurerm_subnet.gateway_subnet.id
}

output "gateway_subnet_name" {
  value = azurerm_subnet.gateway_subnet.name
}

output "gateway_public_ip_id" {
  value = azurerm_public_ip.gateway_public_ip.id
}

output "gateway_public_ip_name" {
  value = azurerm_public_ip.gateway_public_ip.name
}

output "gateway_public_ip_ip_address" {
  value = azurerm_public_ip.gateway_public_ip.ip_address
}

output "gateway_virtual_network_name" {
  value = azurerm_subnet.gateway_subnet.virtual_network_name
}

output "virtual_network_gateway_id" {
  value = azurerm_virtual_network_gateway.virtual_network_gateway.id
}

output "virtual_network_gateway_name" {
  value = azurerm_virtual_network_gateway.virtual_network_gateway.name
}

output "virtual_network_gateway_type" {
  value = azurerm_virtual_network_gateway.virtual_network_gateway.type
}

output "virtual_network_gateway_vpn_type" {
  value = azurerm_virtual_network_gateway.virtual_network_gateway.vpn_type
}

output "virtual_network_gateway_sku" {
  value = azurerm_virtual_network_gateway.virtual_network_gateway.sku
}
