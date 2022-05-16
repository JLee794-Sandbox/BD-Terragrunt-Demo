data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "azurerm_key_vault" "key_vault" {
  name                            = lower(join("", ["kv", format("%v", var.name)]))
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tenant_id                       = var.tenant_id
  purge_protection_enabled        = var.enable_purge_protection
  sku_name                        = var.sku

  network_acls {
    default_action             = var.network_acls_default_action
    bypass                     = var.network_acls_bypass
    ip_rules                   = [ chomp(data.http.myip.body) ]
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "key_vault" {
  count              = var.create_storage_account ? 1 : 0
  name               = "key_vault"
  target_resource_id = azurerm_key_vault.key_vault.id
  storage_account_id = var.storage_account_id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

}
