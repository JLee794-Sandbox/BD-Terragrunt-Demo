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
  value = var.public_domain_name == "" ? "" : azurerm_private_dns_zone.private_dns_zone.0.id
}

output "private_fqdn" {
  value = var.public_domain_name == "" ? "" : trim(azurerm_private_dns_zone.private_dns_zone.soa_record[0].fqdn, ".$")
}
