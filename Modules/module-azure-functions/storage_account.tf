locals {
  storage_account_identity_type = (var.assign_identity ? "SystemAssigned" : null)
}

resource "azurerm_storage_account" "storage_account_functions" {
  count                     = var.create_function ? 1 : 0
  name                      = lower(join("", ["stf", format("%v", var.storage_account_short_name)]))
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.storage_account_type
  account_tier              = var.storage_account_tier
  account_replication_type  = var.storage_account_replication_type
  access_tier               = var.storage_account_access_tier
  enable_https_traffic_only = var.https_only
  tags                      = var.tags

  #  network_rules {
  #   default_action             = var.default_action
  #   bypass                     = var.bypass
  #   ip_rules                   = var.ip_rules
  #   virtual_network_subnet_ids = [azurerm_subnet.subnet_delegation.id]
  # }

  identity {
    type = local.storage_account_identity_type
  }
}

resource "azurerm_storage_account_network_rules" "storage_account_functions" {
  count                = var.create_function ? 1 : 0
  resource_group_name  = var.resource_group_name
  storage_account_name = azurerm_storage_account.storage_account_functions[0].name

  default_action             = var.default_action
  bypass                     = var.bypass
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = [azurerm_subnet.subnet_delegation[0].id]
}
