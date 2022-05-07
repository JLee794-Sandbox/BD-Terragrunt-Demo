variable "name" {
  description = "Specifies the name of the Key Vault."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
}

variable "tenant_id" {
  default     = "94c3e67c-9e2d-4800-a6b7-635d97882165"
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
    "00465881-6c91-4442-85a1-66609b5ab444", #Oleksii Sinelnikov
    "9e74ee73-6e7b-420f-bb88-91dcdc22ab77", #Azure DevOps SP
    "f3bf1b4a-97ef-4c4a-802b-c278651c536c", #New Azure DevOps SP
    "23753573-e497-4bd4-a227-1eace7c0d83f", #Yevhen Beznosov
    "307cef7e-a6c3-415e-bb1a-e364fa48d711", #Anthony Nguyen
    "ea17cef7-71b1-41aa-a652-8deec83441aa", #Andrew Young
    "d69ecaea-b673-4fdf-9612-98ffe582dd67", #Ashok Pandey
    "2584eaf4-5fc9-4a5c-b34f-2ceed3755ee4", #Derek Chang
    "ef7d3d62-c218-4da9-bf9e-dcbbdf6c6d58", #Behnood Babaei
    "dafd883d-7cef-4432-b2cc-0c20a56d076b", #Vladyslav Kramarchuk
    "10f1ed0c-d911-457e-97f0-2d741e9c53c3"  #Denys Pryimak
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
    "managecontacts",
    "manageissuers",
    "purge",
    "recover",
    "restore",
    "setissuers",
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
