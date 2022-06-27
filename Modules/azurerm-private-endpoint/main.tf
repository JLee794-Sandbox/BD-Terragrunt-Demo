# -
# - Private Endpoint + DNS A Record
# -
resource "azurerm_private_endpoint" "this" {
  for_each = var.private_endpoints

  location            = var.location
  resource_group_name = var.resource_group_name

  name      = each.key
  subnet_id = each.value.subnet_id

  private_service_connection {
    name                           = "${each.key}-psc"
    private_connection_resource_id = each.value.private_connection_resource_id
    subresource_names              = each.value.subresource_names
    is_manual_connection           = "false" # True if the connection requires manual approval
  }

  tags = var.tags
}

data "azurerm_private_endpoint_connection" "this" {
  for_each = azurerm_private_endpoint.this

  name                = each.value.name
  resource_group_name = var.resource_group_name
}

output "test" {
  value = data.azurerm_private_endpoint_connection.this
}

resource "azurerm_private_dns_a_record" "this" {
  for_each = data.azurerm_private_endpoint_connection.this

  name    = each.key
  records = [each.value.private_service_connection.0.private_ip_address]

  zone_name = var.private_endpoints[each.key].private_dns_zone_name

  resource_group_name = var.resource_group_name
  ttl                 = 300
}
