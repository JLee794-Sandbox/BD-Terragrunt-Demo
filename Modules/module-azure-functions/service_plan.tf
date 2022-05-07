resource "azurerm_app_service_plan" "app_service_plan" {
  count               = var.create_function ? 1 : 0
  name                = lower(join("", ["plan-", format("%v", var.name)]))
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "functionapp"

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }

  tags = var.tags
}
