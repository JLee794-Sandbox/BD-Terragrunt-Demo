data "azurerm_client_config" "current" {}

resource "azurerm_user_assigned_identity" "service_user_assigned_identity" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = lower(join("",["uai-", format("%v", var.name)]))
  tags                = var.tags
}

resource "azurerm_key_vault_access_policy" "service_key_vault_access_policy" {
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.service_user_assigned_identity.principal_id

  certificate_permissions = []
  key_permissions = []
  secret_permissions = [
    "Get",
    "List",
  ]

  depends_on = [azurerm_user_assigned_identity.service_user_assigned_identity]
}
