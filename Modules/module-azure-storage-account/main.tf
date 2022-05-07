locals {
  storage_account_tier             = (var.storage_account_type == "FileStorage" || var.storage_account_type == "BlockBlobStorage" ? "Premium" : var.storage_account_tier)
  storage_account_replication_type = (local.storage_account_tier == "Premium" ? "LRS" : var.storage_account_replication_type)
}

resource "azurerm_storage_account" "storage_account" {
  count                     = var.create_storage_account ? 1 : 0
  name                      = lower(join("", ["st", format("%v", var.name)]))
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.storage_account_type
  account_tier              = local.storage_account_tier
  account_replication_type  = local.storage_account_replication_type
  access_tier               = var.storage_account_access_tier
  enable_https_traffic_only = var.https_only
  tags                      = var.tags

  network_rules {
    default_action             = var.default_action
    bypass                     = var.bypass
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  identity {
    type = var.assign_identity ? "SystemAssigned" : null
  }
}

resource "azurerm_storage_share" "storage_share" {
  count                = var.create_storage_share ? 1 : 0
  name                 = lower(join("", ["st", format("%v", var.name), "-pvc"]))
  storage_account_name = azurerm_storage_account.storage_account[0].name
  quota                = var.storage_share_quota
}

resource "azurerm_storage_container" "example" {
  count                 = var.create_storage_account ? 1 : 0
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account[0].name
  container_access_type = "private"
}
