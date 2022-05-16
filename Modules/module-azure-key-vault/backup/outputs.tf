output "vault_id" {
  value       = azurerm_key_vault.key_vault.id
  description = "The ID of the Key Vault."
}

output "vault_uri" {
  value       = azurerm_key_vault.key_vault.vault_uri
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
}

output "vault_name" {
  value       = azurerm_key_vault.key_vault.name
  description = "The name of the Key Vault"
}

output "vault_resource_group_name" {
  value       = azurerm_key_vault.key_vault.resource_group_name
  description = "The name of the Key Vault resource_group"
}

output "tenant_id" {
  value       = azurerm_key_vault.key_vault.tenant_id
  description = "The Tenant ID of the Key Vault's Azure AD"
}
