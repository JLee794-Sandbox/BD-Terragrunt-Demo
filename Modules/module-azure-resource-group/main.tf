resource "azurerm_resource_group" "resource_group" {
  name     = lower(join("", ["rg-", format("%v", var.name)]))
  location = var.location
  tags     = var.tags
}
