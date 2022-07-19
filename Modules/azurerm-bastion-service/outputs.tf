output "bastion_dns_name" {
  value = azurerm_bastion_host.this.dns_name
}

output "bastion_ip_address" {
  value = azurerm_public_ip.this.ip_address
}
