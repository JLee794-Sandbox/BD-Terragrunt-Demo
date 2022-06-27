locals {
  if_azuread_administrator_enabled = var.enable_sql_ad_admin ? [{}] : []
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = lower(join("", ["sql-", format("%v", var.name)]))
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password == "" ? random_password.sql_pwd.result : var.administrator_password
  minimum_tls_version          = var.minimum_tls_version

  identity {
    type = "SystemAssigned"
  }

  dynamic "azuread_administrator" {
    for_each = local.if_azuread_administrator_enabled
    content {
      login_username = var.login_username
      object_id      = var.object_id
    }
  }

  tags = var.tags
}


resource "azurerm_mssql_server_extended_auditing_policy" "sql_server_audit_policy" {
  server_id         = azurerm_mssql_server.sql_server.id
  storage_endpoint  = azurerm_storage_account.storage_account_logs.primary_blob_endpoint
  retention_in_days = var.retention_in_days
  depends_on        = [azurerm_role_assignment.sql_logs_assignment, azurerm_mssql_server.sql_server]
}

##----this section is currently not in use because database provisioning handled by Helm chart-----##
##----it receives empty list of var.sql_db_names, hence doing nothing-----------##
resource "azurerm_mssql_database" "sql_db" {
  for_each  = toset(var.sql_db_names)
  name      = lower(join("", ["sqldb-", format("%v", var.name), "-${each.value}"]))
  sku_name  = var.sql_db_sku_name
  server_id = azurerm_mssql_server.sql_server.id
  collation = var.collation

  tags = var.tags
}
##-----end-of-section-------------------#

resource "azurerm_mssql_database_extended_auditing_policy" "sql_database_audit_policy" {
  for_each          = var.auditing_policy > 0 ? toset(var.sql_db_names) : []
  database_id       = azurerm_mssql_database.sql_db[each.key].id
  storage_endpoint  = azurerm_storage_account.storage_account_logs.primary_blob_endpoint
  retention_in_days = var.retention_in_days
  depends_on        = [azurerm_role_assignment.sql_logs_assignment, azurerm_mssql_database.sql_db]
}

resource "azurerm_sql_firewall_rule" "sql_firewall" {
  for_each            = toset(split(",", (join(",", [var.sql_ip_whitelist]))))
  name                = lower(join("", ["sqlfr-", format("%v", var.name), "-${each.value}"]))
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mssql_server.sql_server.name
  start_ip_address    = each.value
  end_ip_address      = each.value
}

resource "azurerm_sql_virtual_network_rule" "sql_vnet" {
  name                = lower(join("", ["sqlvnet-", format("%v", var.name)]))
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mssql_server.sql_server.name
  subnet_id           = var.subnet_id
}

resource "azurerm_storage_container" "sql_security_blob" {
  name                  = "vulnerabilitystore"
  storage_account_name  = azurerm_storage_account.storage_account_vulnerability_assesstment.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "sql_security" {
  resource_group_name        = var.resource_group_name
  server_name                = azurerm_mssql_server.sql_server.name
  state                      = "Enabled"
  retention_days             = 20
  storage_endpoint           = azurerm_storage_account.storage_account_vulnerability_assesstment.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.storage_account_vulnerability_assesstment.primary_access_key
}

resource "azurerm_mssql_server_vulnerability_assessment" "sql_vulnerability_assessment" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.sql_security.id
  storage_container_path          = lower(join("", ["${azurerm_storage_account.storage_account_vulnerability_assesstment.primary_blob_endpoint}", "${azurerm_storage_container.sql_security_blob.name}", "/"]))
  storage_account_access_key      = azurerm_storage_account.storage_account_vulnerability_assesstment.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails                    = var.notification_emails
  }
}
