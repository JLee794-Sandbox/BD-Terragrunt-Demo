output "id" {
  value = azurerm_public_ip.public_ip.id
}

output "name" {
  value = azurerm_public_ip.public_ip.name
}

output "ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "fqdn" {
  value = azurerm_public_ip.public_ip.fqdn
}

output "location" {
  value = azurerm_public_ip.public_ip.location
}

output "resource_group_name" {
  value = azurerm_public_ip.public_ip.resource_group_name
}

output "allocation_method" {
  value = azurerm_public_ip.public_ip.allocation_method
}

output "sku" {
  value = azurerm_public_ip.public_ip.sku
}

output "ip_version" {
  value = azurerm_public_ip.public_ip.ip_version
}

output "zones" {
  value = var.zones
}
