resource "azurerm_key_vault_access_policy" "admins_key_vault_access_policy" {
  key_vault_id = azurerm_key_vault.key_vault.id
  count        = length(var.key_vault_admins_object_ids)
  tenant_id    = var.tenant_id
  object_id    = element(var.key_vault_admins_object_ids, count.index)

  certificate_permissions = var.vault_cert_permissions

  key_permissions = var.vault_key_permissions

  secret_permissions = var.vault_secret_permissions

  depends_on = [azurerm_key_vault.key_vault]
}

resource "azurerm_key_vault_access_policy" "keyreaders_key_vault_access_policy" {
  key_vault_id = azurerm_key_vault.key_vault.id
  count        = length(var.key_vault_keyreaders_object_ids)
  tenant_id    = var.tenant_id
  object_id    = element(var.key_vault_keyreaders_object_ids, count.index)

  certificate_permissions = var.keyreaders_vault_cert_permissions

  key_permissions = var.keyreaders_vault_key_permissions

  secret_permissions = var.keyreaders_vault_secret_permissions

  depends_on = [azurerm_key_vault.key_vault]
}
