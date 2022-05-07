resource "azurerm_storage_account" "storage_account_logs" {
  # count                    = var.auditing_policy ? 1 : 0
  name                     = lower(join("", ["st", format("%v", var.storage_account_logs_name), "sqllogs"]))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags

  # network_rules {
  #   default_action             = var.default_action
  #   bypass                     = var.bypass
  #   virtual_network_subnet_ids = [var.subnet_id]
  # }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_account" "storage_account_vulnerability_assesstment" {
  name                     = lower(join("", ["st", format("%v", var.storage_account_logs_name), "sqlvuln"]))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_account_network_rules" "storage_account_logs" {
  resource_group_name  = var.resource_group_name
  storage_account_name = azurerm_storage_account.storage_account_logs.name

  default_action             = var.default_action
  bypass                     = var.bypass
  virtual_network_subnet_ids = [var.subnet_id]
  depends_on                 = [azurerm_storage_container.sql_security_blob]
}

# SA Network rules
resource "azurerm_storage_account_network_rules" "sql_storage_net_rules" {
  resource_group_name  = var.resource_group_name
  storage_account_name = azurerm_storage_account.storage_account_vulnerability_assesstment.name

  default_action             = "Allow"
  bypass                     = var.bypass
  virtual_network_subnet_ids = [var.subnet_id]
  depends_on                 = [azurerm_storage_container.sql_security_blob]
}


resource "azurerm_role_assignment" "sql_logs_assignment" {
  scope                = azurerm_storage_account.storage_account_logs.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.sql_server.identity.0.principal_id
}

resource "azurerm_role_assignment" "storage_account_vulnerability_assesstment" {
  scope                = azurerm_storage_account.storage_account_vulnerability_assesstment.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.sql_server.identity.0.principal_id
}

# resource "azurerm_role_assignment" "audit_contributor" {
#   scope                = azurerm_storage_account.storage_account_logs.id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = azurerm_mssql_server.sql_server.identity[0].principal_id
# }
