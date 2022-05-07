output "local_network_gateway_id" {
  value = azurerm_local_network_gateway.local_network_gateway.id
}

output "local_network_gateway_name" {
  value = azurerm_local_network_gateway.local_network_gateway.name
}

output "location" {
  value = azurerm_local_network_gateway.local_network_gateway.location
}

output "resource_group_name" {
  value = azurerm_local_network_gateway.local_network_gateway.resource_group_name
}

output "local_network_gateway_address" {
  value = azurerm_local_network_gateway.local_network_gateway.gateway_address
}

output "local_network_gateway_address_space" {
  value = azurerm_local_network_gateway.local_network_gateway.address_space
}

output "virtual_network_gateway_connection_id" {
  value = azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection.id
}

output "virtual_network_gateway_connection_name" {
  value = azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection.name
}

output "virtual_network_gateway_connection_type" {
  value = azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection.type
}
