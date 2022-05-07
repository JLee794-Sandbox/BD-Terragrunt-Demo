variable "name" {
  type        = string
  description = "The name of the Azure Function."
}

variable "storage_account_short_name" {
  type        = string
  description = "The name of the storage account."
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "The name of the location."
}

variable "storage_account_type" {
  type        = string
  default     = "StorageV2"
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
}

variable "storage_account_tier" {
  type        = string
  default     = "Standard"
  description = "The account tier of the storage account."
}

variable "storage_account_access_tier" {
  type        = string
  default     = "Hot"
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
}

variable "storage_account_replication_type" {
  type        = string
  default     = "LRS"
  description = "The replication type of the storage account."
}


variable "https_only" {
  type        = bool
  default     = true
  description = "Set to `true` to only allow HTTPS traffic, or `false` to disable it."
}

variable "assign_identity" {
  type        = bool
  default     = true
  description = "Set to `true` to enable system-assigned managed identity, or `false` to disable it."
}

variable "tags" {
  description = "A mapping of tags to assign to resource."
  default     = {}
}

variable "default_action" {
  default     = "Deny" # To deny all inbound traffic from anywhere except Function App Subnet
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids."
}

variable "bypass" {
  default     = ["AzureServices"]
  description = "Sets which traffic can bypass the network rules. "
}


variable "ip_rules" {
  default     = null
  description = "The list of IP CIRDs to initially grant access to storage account."
  type        = list(string)
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "One or more Subnet ID's which should be able to access this Key Vault."
}

variable "app_runtime_version" {
  type        = string
  default     = "~3"
  description = "The Function Application's runtime version."
}

variable "sku_tier" {
  type        = string
  default     = "Dynamic"
  description = "Specifies the plan's pricing tier."
}

variable "sku_size" {
  type        = string
  default     = "Y1"
  description = "Specifies the plan's instance size."
}

variable "identity_type" {
  description = "Add an Identity (MSI) to the function app. Possible values are SystemAssigned or UserAssigned"
  type        = string
  default     = "SystemAssigned"
}

variable "key_vault_id" {
  description = "ID of keyvault"
  type        = string
}

variable "identity_ids" {
  description = "UserAssigned Identities ID to add to Function App. Mandatory if type is UserAssigned"
  type        = list(string)
  default     = null
}

variable "app_settings" {
  default = null
  type    = map(string)
}

variable "function_secret_permissions" {
  description = "Secret Permissions"
  type        = list(string)

  default = [
    "get"
  ]
}

variable "tenant_id" {
  default     = "94c3e67c-9e2d-4800-a6b7-635d97882165"
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "virtual_network_name" {
  default = ""
}

variable "network_security_group_id" {
  default = ""
}

variable "always_on" {
  default = true
}

variable "ip_restriction_rules" {
  description = "List of Inbound Rules for IP Restriction"
  type        = list(any)
}

variable "delegation_prefix" {
  default = "to-subnet"
}

variable "address_prefixes" {
  description = "Subnet with delegation address prefix"
  default     = ["10.0.3.0/24"]
}

variable "service_endpoints" {
  description = " The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web."
  type        = list(any)
  default     = ["Microsoft.Web", "Microsoft.Storage", "Microsoft.KeyVault"]
}
variable "ftps_state" {
  type        = string
  default     = "Disabled"
  description = " State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled."
}

variable "create_function" {
  default     = true
  description = "Create Azure Function"
}
