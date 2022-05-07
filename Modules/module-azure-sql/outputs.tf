
output "sql_server_id" {
  description = "Azure SQL Server ID"
  value       = azurerm_mssql_server.sql_server.id
}

output "sql_server_name" {
  description = "Azure SQL Server name"
  value       = azurerm_mssql_server.sql_server.name
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name of  Azure SQL Server"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}


output "sql_server_admin_user" {
  description = "SQL database administrator login id"
  value       = azurerm_mssql_server.sql_server.administrator_login
}

output "sql_database_id" {
  description = "The SQL Database ID"
  value       = values(azurerm_mssql_database.sql_db)[*].id
}

output "sql_database_name" {
  description = "The SQL Database Name"
  value       = values(azurerm_mssql_database.sql_db)[*].name
}
