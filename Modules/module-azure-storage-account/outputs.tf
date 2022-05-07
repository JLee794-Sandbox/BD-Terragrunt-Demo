output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.storage_account[*].id
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage_account[*].name
}

output "storage_account_primary_location" {
  description = "The primary location of the storage account"
  value       = azurerm_storage_account.storage_account[*].primary_location
}

output "storage_share_id" {
  description = "The ID of the File Share."
  value       = azurerm_storage_share.storage_share[*].id
}
