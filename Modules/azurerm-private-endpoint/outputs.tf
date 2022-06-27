output "private_endpoints" {
  value = azurerm_private_endpoint.this
}

output "dns_a_records" {
  value = azurerm_private_dns_a_record.this
}
