output "id" {
  value = azurerm_subnet.subnet.id
}

output "name" {
  value = azurerm_subnet.subnet.name
}

output "resource_group_name" {
  value = azurerm_subnet.subnet.resource_group_name
}

output "virtual_network_name" {
  value = azurerm_subnet.subnet.virtual_network_name
}

output "address_prefixes" {
  value = azurerm_subnet.subnet.address_prefixes
}
