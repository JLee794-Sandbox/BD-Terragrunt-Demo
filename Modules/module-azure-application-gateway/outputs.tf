output "id" {
  value = azurerm_application_gateway.application_gateway.id
}

output "name" {
  value = azurerm_application_gateway.application_gateway.name
}

output "resource_group_name" {
  value = azurerm_application_gateway.application_gateway.resource_group_name
}

output "location" {
  value = azurerm_application_gateway.application_gateway.location
}

output "backend_address_pool_id" {
  value = azurerm_application_gateway.application_gateway.backend_address_pool[0].id
}

output "frontend_ip_configuration_id" {
  value = azurerm_application_gateway.application_gateway.frontend_ip_configuration[0].id
}

output "gateway_ip_configuration_id" {
  value = azurerm_application_gateway.application_gateway.gateway_ip_configuration[0].id
}

output "ssl_certificate_id" {
  value = azurerm_application_gateway.application_gateway.ssl_certificate[0].id
}

output "frontend_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "frontend_fqdn" {
  value = azurerm_public_ip.public_ip.fqdn
}
