output "uis_service_user_assigned_identity_id" {
  description = "User assigned identity id"
  value       = azurerm_user_assigned_identity.service_user_assigned_identity.id
}

output "uis_service_user_assigned_identity_principal_id" {
  description = "Service principal id associated with the user assigned identity"
  value       = azurerm_user_assigned_identity.service_user_assigned_identity.principal_id
}

output "uis_service_user_assigned_identity_client_id" {
  description = "Client id associated with the user assigned identity"
  value       = azurerm_user_assigned_identity.service_user_assigned_identity.client_id
}
