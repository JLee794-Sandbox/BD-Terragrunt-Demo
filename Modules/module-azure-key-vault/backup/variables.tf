variable "name" {
  description = "Specifies the name of the Key Vault."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "storage_account_id" {
  description = "Storage account ID to save keyvault diagnostic settings"
}

variable "location" {
  default     = "eastus"
  description = "Specifies the supported Azure location where the resource will be created."
}

variable "sku" {
  description = "The Name of the SKU used for this Key Vault."
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  type        = string
  default     = "true"
  description = " Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
}

variable "enabled_for_deployment" {
  type        = string
  default     = "false"
  description = "Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
}

variable "enabled_for_template_deployment" {
  type        = string
  default     = "true"
  description = "Azure Resource Manager is permitted to retrieve secrets from the key vault."
}

variable "network_acls_default_action" {
  default     = "Deny"
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids."
}

variable "network_acls_bypass" {
  default     = "AzureServices"
  description = "Sets which traffic can bypass the network rules. "
}

variable "key_vault_admins_object_ids" {
  default = [
  ]
  description = "Object Ids needing admin access to the Key Vault"
  type        = list(string)
}

variable "vault_key_permissions" {
  description = "Key Permissions"
  type        = list(string)

  default = [
    "backup",
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey",
  ]
}

variable "vault_cert_permissions" {
  description = "Cert Permissions"
  type        = list(string)

  default = [
    "backup",
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "purge",
    "recover",
    "restore",
    "update",
  ]
}

variable "vault_secret_permissions" {
  description = "Secret Permissions"
  type        = list(string)

  default = [
    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set",
  ]
}

variable "key_vault_keyreaders_object_ids" {
  description = "Object Ids needing Key read access to the Key Vault"
  type        = list(string)
  default     = []
}

variable "keyreaders_vault_key_permissions" {
  description = "Key Permissions for KeyVault Key Readers"
  type        = list(string)

  default = [
    "encrypt",
    "decrypt",
    "get",
    "list",
    "unwrapKey",
    "verify",
    "create",
    "import",
  ]
}

variable "keyreaders_vault_cert_permissions" {
  description = "Cert Permissions for KeyVault Key Readers"
  type        = list(string)

  default = [
    "get",
    "list",
    "create",
    "import",
    "getissuers",
    "listissuers",
  ]
}

variable "keyreaders_vault_secret_permissions" {
  description = "Secret Permissions for KeyVault Key Readers"
  type        = list(string)

  default = [
    "set",
    "get",
    "list",
  ]
}

variable "ip_rules" {
  default     = "0.0.0.0/0"
  description = "List of whitelisted IP address for HTTPS inbound"
}

variable "tags" {
  description = "A mapping of tags to assign to resources"
  default     = {}
  type = map
}


variable "enable_purge_protection" {
  default     = true
  description = "The switch to enable purge-protection property for KeyVault"
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "One or more Subnet ID's which should be able to access this Key Vault."
}

variable "create_storage_account" {
  description = "Create storage account"
}
