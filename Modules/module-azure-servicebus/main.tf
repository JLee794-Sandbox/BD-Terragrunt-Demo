resource "azurerm_servicebus_namespace" "servicebus" {
  count               = var.create_servicebus ? 1 : 0
  name                = lower(join("", ["sb-", var.name]))
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  capacity            = var.sku == "Premium" ? var.capacity : 0
  zone_redundant      = var.zone_redundant
  tags                = var.tags

}



resource "azurerm_servicebus_namespace_network_rule_set" "servicebus_namespace_network_rule_set" {
  count               = var.sku == "Premium" ? 1 : 0
  namespace_name      = azurerm_servicebus_namespace.servicebus[0].name
  resource_group_name = var.resource_group_name

  default_action = "Deny"

  network_rules {
    subnet_id                            = var.subnet_id
    ignore_missing_vnet_service_endpoint = var.ignore_missing_vnet_service_endpoint

  }

  ip_rules = split(",", (join(",", [var.sb_ip_whitelist])))
}
