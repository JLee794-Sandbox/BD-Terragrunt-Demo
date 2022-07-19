resource "azurerm_dns_zone" "dns_zone" {
  name                = var.public_domain_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_a_record" "dns_record" {
  for_each = var.dns_a_records

  name                = each.key
  zone_name           = each.value.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = lookup("ttl", each.value.zone, "30")
  records             = each.value.records
}
