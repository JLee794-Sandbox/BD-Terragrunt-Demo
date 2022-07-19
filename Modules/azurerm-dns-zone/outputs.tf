output "dnz_zone" {
  value = azurerm_dns_zone.dns_zone.*
}

output "name" {
  value = azurerm_dns_a_record.dns_record.*
}
