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
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.sql_server_pass](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_mssql_database.sql_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_database_extended_auditing_policy.sql_database_audit_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database_extended_auditing_policy) | resource |
| [azurerm_mssql_server.sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.sql_server_audit_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_security_alert_policy.sql_security](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_security_alert_policy) | resource |
| [azurerm_mssql_server_vulnerability_assessment.sql_vulnerability_assessment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_vulnerability_assessment) | resource |
| [azurerm_role_assignment.sql_logs_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.storage_account_vulnerability_assesstment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_sql_firewall_rule.sql_firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_firewall_rule) | resource |
| [azurerm_sql_virtual_network_rule.sql_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_virtual_network_rule) | resource |
| [azurerm_storage_account.storage_account_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account.storage_account_vulnerability_assesstment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.sql_storage_net_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_account_network_rules.storage_account_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_container.sql_security_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [random_password.sql_pwd](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | The replication type of the storage account. | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | The account tier of the storage account. | `string` | `"Standard"` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server. Changing this forces a new resource to be created. | `string` | `"sqladmin"` | no |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | The password of default SQL administrator. | `string` | `""` | no |
| <a name="input_auditing_policy"></a> [auditing\_policy](#input\_auditing\_policy) | Audit policy for SQL server and database | `number` | `1` | no |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Sets which traffic can bypass the network rules. | `list` | <pre>[<br>  "Logging",<br>  "Metrics",<br>  "AzureServices"<br>]</pre> | no |
| <a name="input_collation"></a> [collation](#input\_collation) | The name of the collation. Applies only if create\_mode is Default. Azure default is SQL\_LATIN1\_GENERAL\_CP1\_CI\_AS. Changing this forces a new resource to be created. | `string` | `"SQL_LATIN1_GENERAL_CP1_CI_AS"` | no |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. | `string` | `"Deny"` | no |
| <a name="input_enable_sql_ad_admin"></a> [enable\_sql\_ad\_admin](#input\_enable\_sql\_ad\_admin) | Allows you to set a user or group as the AD administrator for an Azure SQL server | `bool` | `false` | no |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | keyvault ID | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | SQL resource location | `string` | `"eastus"` | no |
| <a name="input_login_username"></a> [login\_username](#input\_login\_username) | The Azure Active Directory user name that should be used for Azure SQL server as admin . | `any` | `null` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2. | `string` | `"1.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the SQL to create. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_notification_emails"></a> [notification\_emails](#input\_notification\_emails) | List of notification emails for security assesstments | `list` | `[]` | no |
| <a name="input_object_id"></a> [object\_id](#input\_object\_id) | The Azure Active Directory user object ID that should be used for Azure SQL server as admin . | `any` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the number of days to retain logs for in the storage account. | `number` | `7` | no |
| <a name="input_sql_db_names"></a> [sql\_db\_names](#input\_sql\_db\_names) | A list of databases name | `list(string)` | `[]` | no |
| <a name="input_sql_db_sku_name"></a> [sql\_db\_sku\_name](#input\_sql\_db\_sku\_name) | Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP\_S\_Gen5\_2,HS\_Gen4\_1,BC\_Gen5\_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100 | `string` | `"Basic"` | no |
| <a name="input_sql_ip_whitelist"></a> [sql\_ip\_whitelist](#input\_sql\_ip\_whitelist) | SQL ip whitelist addresses | `string` | `"0.0.0.0"` | no |
| <a name="input_sql_server_version"></a> [sql\_server\_version](#input\_sql\_server\_version) | The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). | `string` | `"12.0"` | no |
| <a name="input_storage_account_logs_name"></a> [storage\_account\_logs\_name](#input\_storage\_account\_logs\_name) | Storage account name for sql server/db logs | `any` | `null` | no |
| <a name="input_storage_endpoint"></a> [storage\_endpoint](#input\_storage\_endpoint) | Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net). | `any` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet that the SQL server will be connected to. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource group | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sql_database_id"></a> [sql\_database\_id](#output\_sql\_database\_id) | The SQL Database ID |
| <a name="output_sql_database_name"></a> [sql\_database\_name](#output\_sql\_database\_name) | The SQL Database Name |
| <a name="output_sql_server_admin_user"></a> [sql\_server\_admin\_user](#output\_sql\_server\_admin\_user) | SQL database administrator login id |
| <a name="output_sql_server_fqdn"></a> [sql\_server\_fqdn](#output\_sql\_server\_fqdn) | The fully qualified domain name of  Azure SQL Server |
| <a name="output_sql_server_id"></a> [sql\_server\_id](#output\_sql\_server\_id) | Azure SQL Server ID |
| <a name="output_sql_server_name"></a> [sql\_server\_name](#output\_sql\_server\_name) | Azure SQL Server name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
