output "id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "resource_group_name" {
  value = azurerm_virtual_network.virtual_network.resource_group_name
}

output "location" {
  value = azurerm_virtual_network.virtual_network.location
}

output "address_space" {
  value = azurerm_virtual_network.virtual_network.address_space
}

output "private_id" {
  value = azurerm_private_dns_zone.private_dns_zone.id
}

output "private_fqdn" {
  value = trim(azurerm_private_dns_zone.private_dns_zone.soa_record[0].fqdn, ".$")
}

output "public_id" {
  value = length(azurerm_dns_zone.this) > 0 ? azurerm_dns_zone.this[0].id : null
}

output "public_name_servers" {
  value = length(azurerm_dns_zone.this) > 0 ? azurerm_dns_zone.this[0].name_servers : null
}
