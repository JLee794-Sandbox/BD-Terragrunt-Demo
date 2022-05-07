output "function_name" {
  value       = azurerm_function_app.function_app[*].name
  description = "The name of the Function App for Tenant Deploy"
}

output "function_id" {
  value       = azurerm_function_app.function_app[*].id
  description = "The ID of the Function App for Tenant Deploy"
}

output "function_identity" {
  value       = try(azurerm_function_app.function_app[*].identity.0.principal_id, null)
  description = "Identity block output of the Function App"
}

output "function_possible_outbound_ip" {
  value       = azurerm_function_app.function_app[*].possible_outbound_ip_addresses
  description = "Function Possible Outbound IPs for whitelisting"
}

output "function_subnet_with_delegation" {
  value       = azurerm_subnet.subnet_delegation[*].id
  description = "Subnet with delegation to Microsoft.Web/serverFarms"
}

output "default_hostname" {
  value       = try(azurerm_function_app.function_app[0].default_hostname, null)
  description = "The default hostname associated with the Function App"
}
