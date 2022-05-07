variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  default     = "eastus"
  description = "SQL resource location"
}

variable "tags" {
  description = "A mapping of tags to assign to resource group"
  default     = {}
}

variable "name" {
  description = "The name of the SQL to create. Changing this forces a new resource to be created."
}

# variable "keyvault_name" {
#   description = "example: kvuisinfradeus001 - Specifies the name of the Key Vault where SSH key and KEK is stored."
# }

variable "keyvault_id" {
  description = "keyvault ID"
}

# variable "keyvault_resource_group_name" {
#   description = "example: rg-uis-infra-dev-eastus-001 - The name of the Resource Group in which the Key Vault exists."
# }

variable "administrator_login" {
  default     = "sqladmin"
  description = "The administrator login name for the new server. Changing this forces a new resource to be created."
}

variable "administrator_password" {
  type        = string
  default     = ""
  description = "The password of default SQL administrator."
}

variable "sql_server_version" {
  default     = "12.0"
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
}

variable "sql_db_sku_name" {
  default     = "Basic"
  description = "Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100"
}

variable "collation" {
  default     = "SQL_LATIN1_GENERAL_CP1_CI_AS"
  description = "The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS. Changing this forces a new resource to be created."
}

variable "subnet_id" {
  description = "The ID of the subnet that the SQL server will be connected to."
}

variable "minimum_tls_version" {
  default     = "1.2"
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2."
}

variable "enable_sql_ad_admin" {
  description = "Allows you to set a user or group as the AD administrator for an Azure SQL server"
  default     = false
}

variable "object_id" {
  default     = null
  description = "The Azure Active Directory user object ID that should be used for Azure SQL server as admin ."
}

variable "login_username" {
  default     = null
  description = "The Azure Active Directory user name that should be used for Azure SQL server as admin ."
}

variable "sql_db_names" {
  description = "A list of databases name"
  type        = list(string)
  default     = []
}

variable "storage_endpoint" {
  default     = null
  description = "Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net)."
}

variable "retention_in_days" {
  default     = 7
  description = "Specifies the number of days to retain logs for in the storage account."
}

variable "auditing_policy" {
  default     = 1
  description = "Audit policy for SQL server and database"
}

variable "account_kind" {
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "The account tier of the storage account."
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "The replication type of the storage account."
}

variable "storage_account_logs_name" {
  description = "Storage account name for sql server/db logs"
  default     = null
}

variable "default_action" {
  default     = "Deny"
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids."
}

variable "bypass" {
  default     = ["Logging", "Metrics", "AzureServices"]
  description = "Sets which traffic can bypass the network rules. "
}

variable "sql_ip_whitelist" {
  description = "SQL ip whitelist addresses"
  default     = "0.0.0.0"
}

variable "notification_emails" {
  default     = []
  description = "List of notification emails for security assesstments"
}
