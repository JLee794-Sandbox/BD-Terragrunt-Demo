resource "random_password" "sql_pwd" {
  length           = 24
  special          = true
  override_special = "/@\" "
}

resource "azurerm_key_vault_secret" "sql_server_pass" {
  name         = lower(join("", ["sql-", format("%v", var.name), "-pwd"]))
  value        = var.administrator_password == "" ? random_password.sql_pwd.result : var.administrator_password
  key_vault_id = var.keyvault_id
}
