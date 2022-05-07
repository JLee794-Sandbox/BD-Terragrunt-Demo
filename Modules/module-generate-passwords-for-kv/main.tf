resource "random_password" "random-generated-password" {
  length           = var.password_length
  min_lower        = var.min_lower
  min_numeric      = var.min_numeric
  min_special      = var.min_special
  min_upper        = var.min_upper
  number           = var.include_numbers
  upper            = var.include_upper
  lower            = var.include_lower
  special          = var.include_special_characters
  override_special = var.override_special
}

resource "azurerm_key_vault_secret" "vault-secret-password" {
  name         = var.secret_name
  value        = random_password.random-generated-password.result
  key_vault_id = var.key_vault_id
}
