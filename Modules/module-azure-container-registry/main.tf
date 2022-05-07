resource "azurerm_container_registry" "acr" {
  name                     = lower(join("", ["acr", format("%v", var.name)]))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  georeplication_locations = var.sku == "Premium" ? var.georeplication_locations : null
  network_rule_set         = var.network_rule_set
  tags                     = var.tags
}
