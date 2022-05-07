resource "azurerm_key_vault_access_policy" "function_key_vault_access_policy" {
  count        = var.create_function ? 1 : 0
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_function_app.function_app[0].identity[0].principal_id

  certificate_permissions = [
    "create",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "setissuers",
    "update",
  ]

  key_permissions = null

  secret_permissions = var.function_secret_permissions

}
