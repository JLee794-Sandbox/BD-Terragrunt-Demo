# module-azure-sql

Terraform module to provision a [Azure SQL Database ](<https://docs.microsoft.com/en-us/azure/azure-sql/database/sql-database-paas-overview>).

## Usage

```HCL
module "azure_sql" {
  source                       = "./../module-azure-sql"
  resource_group_name          = "rg-rnd-uis-dev-eastus-01"
  name                         = "uis-rnd-uis-dev-eastus-01"
  location                     = "eastus"
  administrator_login          = "bd_admin"
  keyvault_name                = module.key_vault.name
  keyvault_resource_group_name = module.key_vault.resource_group
  subnet_id                    = "/subscriptions/8cc6b0e7-e341-4103-bed6-574d6b298337/resourceGroups/rg-uis-infra-dev-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-uis-infra-dev-eastus-001/subnets/default"

  tags = {
    "Confidentiality" : "private"
    "SLA"             : "24hours"
    "BusinessImpact"  : "Moderate"
    "BusinessProcess" : "Suppor"
    "RevenueImpact"   : "High"
    "ManagedBy"       : "DevOps"
  }
}

```
## Notes

As discussed on internall meeting, database instance provisioning will be handled by Helm chart, hence var.sql_db_names has no values.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | The name of the Resource Group where Azure SQL Server and Database will be located | string | n/a | yes |
| name | The name of the Resource Group where Azure SQL Server, prefix "sql-, sqldb, sqlvnet" will be added at the beginning automatically via terraform according to naming convention | string | n/a | yes |
| location | Specifies the supported Azure location where Azure SQL Server and Database will be created. | string | eastus | yes |
| administrator_login | The administrator login name for the new server. Changing this forces a new resource to be created. | string |bd_admin| yes |
| sql_server_version | The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). | string | 12.0 | yes |
| sql_db_sku_name |  Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100 | string | Basic | yes |
| collation | The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS. Changing this forces a new resource to be created. | string | SQL_LATIN1_GENERAL_CP1_CI_AS | no |
| subnet_id |The ID of the subnet that the SQL server will be connected to.| string | n/a | yes |
| start_ip_address | The starting IP address to allow through the firewall for this rule. | string | 0.0.0.0 | no |
| end_ip_address |The ending IP address to allow through the firewall for this rule. | string | 0.0.0.0 | no |
| minimum_tls_version | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2. | string | 1.2 | no |
| enable_sql_ad_admin | Allows you to set a user or group as the AD administrator for an Azure SQL server (if true specify object_id and login_username) | string | false| no |
| object_id | The Azure Active Directory user object ID that should be used for Azure SQL server as admin. | string | null | no |
| login_username | The Azure Active Directory user name that should be used for Azure SQL server as admin. | string | null | no |
| auditing_policy | Allows you to enable an audit policy for SQL server and database (if true specify storage_endpoint and storage_account_access_key) | string | false | no |
| storage_endpoint | Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net). | string | null | no |
| storage_account_access_key | Specifies the access key to use for the auditing storage account. | string | null | no |
| retention_in_days | Specifies the number of days to retain logs for in the storage account. | string | 7 | no |
| account_kind | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | string | StorageV2 | yes |
| account_tier |The account tier of the storage account.Valid options are Standard, Premium | string | Standard | yes |
| account_replication_type |The replication type of the storage account. (LRS,RAGRS,ZRS..) | string | LRS | yes |
| storage_account_logs_name |The  storage account name (required only if threat_detection_policy or auditing_policy enabled ) | string | null | yes |
| bypass | Sets which traffic can bypass the network rules. | list | `["AzureServices"]` | no |
| default_action | The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. | string | `"Deny"` | no |
| sql_ip_whitelist | SQL whitelist of ip addresses. | string | null | no |



## Outputs

| Name | Description |
|------|-------------|
| sql_server_id | Azure SQL Server ID |
| sql_server_name | azurerm_mssql_server.sql_server.name|
| sql_server_fqdn | The fully qualified domain name of  Azure SQL Server|
| sql_server_admin_user | SQL database administrator login id|
| sql_database_id | The SQL Database ID |
| sql_database_name | The SQL Database Name|

## Changelog

### v 0.0.1 2020-11-25

* Initial version
