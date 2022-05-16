data "azurerm_client_config" "current" {}
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.sku_name

  network_acls {
    default_action             = var.network_acls_default_action
    bypass                     = var.network_acls_bypass
    ip_rules                   = [ chomp(data.http.myip.body) ]
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Delete",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Delete",
      "Set",
      "Purge"
    ]

    storage_permissions = [
      "Get",
      "Set",
      "List",
      "Update",
      "Delete"
    ]
  }
  tags = var.tags
}
